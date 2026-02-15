import Foundation

// 택시비를 아껴보자
// 두 사람이 모두 귀가하는데 필요한 요금

// 지점은 1~n개

// 시작점 - a, 시작점 - b

// s-a. s-b
// a-b

// 1. 합승을 하지 않는 경우 (다익스트라)
// s-a
// s-b

// 2. 지나치는 경로인 경우
// s-a-b
// s-b-a

// 3. 
// s-k-a
// s-k-b

// 2. 합승을 하는 경우
// n: 3~200
// s,a,b는 모두 다른 값
// E: 최대 2만개 정도
// 요금은 10만원 이하

// 1. fares -> graph

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    var graph: [Int: [(v: Int, f: Int)]] = [:]
    for fare in fares {
        graph[fare[0], default: []].append((fare[1], fare[2]))
        graph[fare[1], default: []].append((fare[0], fare[2]))
    }
    
    let dfs = dijkstra(n, s, graph)
    let dfa = dijkstra(n, a, graph)
    let dfb = dijkstra(n, b, graph)
    
    var minCost = Int.max
     
    // 특정 지점 k에서 나눠타는 경우
    // k == s이면 처음부터 나눠탄 케이스
    // k == a이면 s-a-b로 간 케이스
    // k == b이면 s-b-a로 간 케이스
    // k == k이면 중간에 나눠탄 케이스
    for k in (1...n) {
        if dfs[k] + dfa[k] + dfb[k] < minCost {
            minCost = dfs[k] + dfa[k] + dfb[k]
        }
    }
    
    return minCost
}

func dijkstra(_ n: Int, _ s: Int, _ graph: [Int: [(v: Int, f: Int)]]) -> [Int] {
    let INF = Int.max / 4
    var d = [Int](repeating: INF, count: n+1)
    d[s] = 0
    
    var pq = Heap<(v: Int, f: Int)>(compare: { $0.f < $1.f })
    pq.heapPush((s, 0))
    
    while !pq.isEmpty {
        let cur = pq.heapPop()!
        
        if d[cur.v] < cur.f { continue }
        
        for e in graph[cur.v, default: []] {
            if d[cur.v] + e.f < d[e.v] {
                d[e.v] = d[cur.v] + e.f
                pq.heapPush((e.v, d[e.v]))
            }
        }
    }
    
    return d
}

struct Heap<T> {
    var heap: [T] = []
    var compare: (T, T) -> Bool
    var isEmpty: Bool { heap.count < 2 }
    
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
        while curIdx/2 > 0 && compare(heap[curIdx/2], heap[curIdx]) {
            heap.swapAt(curIdx, curIdx/2)
            curIdx /= 2
        }
    }
    mutating func heapPop() -> T? {
        if heap.count < 2 { return nil }
        if heap.count == 2 { return heap.removeLast() }
        
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