// N개의 마을 1명의 학생
// M개의 단방향 도로, T를 소비 (1~100 양수)
// 가장 많은 시간을 소비하는 학생은 누구?

// k -> x -> k
// 다익스트라(x -> k)는 가능해. 시작점 x로 하면되니까.
// k -> x는 매번 계산 O(11000 * 1000) + O(11000)

struct Heap<T> {
    var heap: [T] = []
    var compare: (T,T) -> Bool
    init(compare: @escaping (T,T) -> Bool) {
        self.compare = compare
    }
    var isEmpty: Bool { return heap.count < 2 }
    mutating func heapPush(_ k: T) {
        if heap.isEmpty {
            heap.append(k)
            heap.append(k)
            return
        }
        heap.append(k)
        swimUp(heap.count-1)
    }
    mutating func swimUp(_ idx: Int) {
        var curIdx = idx
        while curIdx/2 > 0 && compare(heap[curIdx], heap[curIdx/2]) {
            heap.swapAt(curIdx, curIdx/2)
            curIdx /= 2
        }
    }
    mutating func heapPop() -> T? {
        if heap.count < 2 { return nil }
        if heap.count == 2 { return heap.popLast() }
        
        let top = heap[1]
        heap[1] = heap.removeLast()
        swimDown(1)
        return top
    }
    mutating func swimDown(_ idx: Int) {
        var curIdx = idx
        while true {
            var targetIdx = curIdx
            let leftIdx = curIdx * 2
            let rightIdx = curIdx * 2 + 1
            
            if leftIdx < heap.count && compare(heap[leftIdx], heap[targetIdx]) {
                targetIdx = leftIdx
            }
            
            if rightIdx < heap.count && compare(heap[rightIdx], heap[targetIdx]) {
                targetIdx = rightIdx
            }
            
            if targetIdx != curIdx {
                heap.swapAt(targetIdx, curIdx)
                curIdx = targetIdx
            } else {
                break
            }
        }
    }
}

func dijkstra(_ n: Int, _ s: Int, _ graph: [Int: [(v: Int, t: Int)]]) -> [Int] {

    let INF = Int.max/4
    var T = [Int](repeating: INF, count: n+1)
    T[s] = 0
    var pq = Heap<(v: Int, t: Int)>(compare: { $0.t < $1.t })
    pq.heapPush((s, 0))
    
    while !pq.isEmpty {
        let cur = pq.heapPop()!
        
        if T[cur.v] < cur.t { continue }
        
        for next in graph[cur.v, default: []] {
            if T[cur.v] + next.t < T[next.v] {
                T[next.v] = T[cur.v] + next.t
                pq.heapPush((next.v, T[next.v]))
            }
        }
    }

    return T
}

func solution(_ n: Int, _ x: Int, _ info: [[Int]]) -> Int {
    
    var graph: [Int: [(v: Int, t: Int)]] = [:]
    for i in info {
        let (a, b, t) = (i[0], i[1], i[2])
        graph[a, default: []].append((b, t))
    }
    
    var total = [Int](repeating: 0, count: n+1)
    var x_to = dijkstra(n, x, graph)
    
    for i in 1...n {
        let i_to = dijkstra(n, i, graph)
        total[i] += i_to[x] + x_to[i]
    }

    return total.max()!
}

let NMX = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NMX[0] // 1~1000개의 마을
let M = NMX[1] // 1~1만개의 도로
let X = NMX[2] // 모이는 마을
var info = [[Int]]()
for _ in 0..<M { 
    info.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
print(solution(N, X, info))