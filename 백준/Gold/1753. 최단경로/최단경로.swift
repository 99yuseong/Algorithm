// 방향 그래프
// 1개의 정점에서 모든 정점으로의 최단 경로
// 10이하의 양수

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
        while curIdx / 2 > 0 && compare(heap[curIdx], heap[curIdx/2]) {
            heap.swapAt(curIdx/2, curIdx)
            curIdx /= 2
        }
    }
    mutating func heapPop() -> T? {
        if heap.count < 2 { return nil }
        if heap.count == 2 { return heap.removeLast() }

        heap.swapAt(1, heap.count-1)
        let top = heap.removeLast()
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

func solution(_ v: Int, _ k: Int, _ info: [[Int]]) -> [String] {

    var graph: [Int: [(v: Int, c: Int)]] = [:]
    for i in info {
        let u = i[0]
        let v = i[1]
        let w = i[2]
        graph[u, default: []].append((v, w))
    }
    
    func dijkstra(_ v: Int, _ s: Int, _ graph: [Int: [(v: Int, c: Int)]]) -> [String] {
        let INF = Int.max/4
        var cost = [Int](repeating: INF, count: v+1)
        var pq = Heap<(v: Int, c: Int)>(compare: { $0.c < $1.c })
        pq.heapPush((s, 0))
        cost[s] = 0
        while !pq.isEmpty {
            let cur = pq.heapPop()!
            if cost[cur.v] < cur.c { continue }
            for next in graph[cur.v, default: []] {
                 if cost[cur.v] + next.c < cost[next.v] {
                     cost[next.v] = cost[cur.v] + next.c
                     pq.heapPush((next.v, cost[next.v]))
                 }
            }
        }
        return Array(cost[1...]).map { $0 == INF ? "INF" : "\($0)" }
    }
    return dijkstra(v, k, graph)
}

let VE = readLine()!.split(separator: " ").map { Int(String($0))! }
let V = VE[0] // 1~2만
let E = VE[1] // 1~30만
let K = Int(readLine()!)!
var INFO = [[Int]]()
for _ in 0..<E { 
    INFO.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
let DIST = solution(V, K, INFO)
print(DIST.joined(separator: "\n"))