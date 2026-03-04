// 방향성이 없는 그래프
// 1 ~ N까지 최단 거리로 이동
// 1 -> a1 -> a2 -> N

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

// 1 -> a1 -> a2 -> N

func solution(_ n: Int, _ v1: Int, _ v2: Int, _ info: [[Int]]) -> Int {
    var graph: [Int: [(v: Int, t: Int)]] = [:]
    for i in info {
        let (a, b, t) = (i[0], i[1], i[2])
        graph[a, default: []].append((b, t))
        graph[b, default: []].append((a, t))
    }
    
    let oneTo = dijkstra(n, 1, graph)
    let v1To = dijkstra(n, v1, graph)
    let v2To = dijkstra(n, v2, graph)

    let oneV1V2n = oneTo[v1] + v1To[v2] + v2To[n]
    let oneV2V1n = oneTo[v2] + v2To[v1] + v1To[n]
    
    let minRoute = min(oneV1V2n, oneV2V1n)
    let INF = Int.max/4
    
    return minRoute >= INF ? -1 : minRoute
}

let NE = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NE[0] // 2~800 지점
let E = NE[1] // 0~20만 간선
var info = [[Int]]()
for _ in 0..<E {  
    info.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
let V = readLine()!.split(separator: " ").map { Int(String($0))! }
let V1 = V[0]
let V2 = V[1]
print(solution(N, V1, V2, info))
