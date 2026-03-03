// n개의 도시 : 1~1000개
// m개의 버스 : 1~10만대

// 버스의 비용을 최소화. - 비용과 경로
// 비용은 0~10만

// s -> e로 가는 최단 경로를 구해라.
// 간선의 비중은 양수 > 다익스트라

// 1. buses > 방향 그래프, 비중을 어디에?
// 2. heap 구현
// 3. 다익스트라 구현

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
        while curIdx / 2 > 0 && compare(heap[curIdx/2], heap[curIdx]) {
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

func solution(_ n: Int, _ m: Int, _ s: Int, _ e: Int, _ buses: [[Int]]) -> (cost: Int, cities: Int, route: [Int]) {

    var graph: [Int: [(city: Int, cost: Int)]] = [:]
    for bus in buses {
        let a = bus[0]
        let b = bus[1]
        let c = bus[2]
        graph[a, default: []].append((b, c))
    }
    
    let INF = Int.max / 4
    var cost = [Int](repeating: INF, count: n+1)
    var prev = [Int](repeating: -1, count: n+1)
    cost[s] = 0
    
    var pq = Heap<(city: Int, cost: Int)>(compare: { $0.cost > $1.cost })
    pq.heapPush((s, 0))
    
    while !pq.isEmpty {
        let cur = pq.heapPop()!
        
        if cost[cur.city] < cur.cost { continue }
        
        for next in graph[cur.city, default: []] {
            if cost[cur.city] + next.cost < cost[next.city] {
                cost[next.city] = cost[cur.city] + next.cost
                pq.heapPush((next.city, cost[next.city]))
                prev[next.city] = cur.city
            }
        }
    }
    
    var route: [Int] = [e]
    while true {
        let cur = prev[route.last!]
        if cur == -1 { break }
        route.append(cur)
    }
    return (cost[e], route.count, route.reversed())
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var buses = [[Int]]()
for _ in 0..<m {
    buses.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
let se = readLine()!.split(separator: " ").map { Int(String($0))! }
let s = se[0]
let e = se[1]
let (cost, cities, route) = solution(n, m, s, e, buses)
print(cost)
print(cities)
print(route.map { String($0) }.joined(separator: " "))