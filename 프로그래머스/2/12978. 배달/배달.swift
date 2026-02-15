import Foundation

// N개의 마을
// 그래프 정보 > 주문을 받을 수 있는 마을 수를 리턴

// N: 1~50
// E: 1~2000
// 도로는 여러개일 수 있음 but 최소만 알면 됨
// K: 1~50만

// 자기자신도 포함해야함

// 1. 다익스트라로 마을 1에서 도달하는 거리 배열 연산
// 2. 배열에서 k이하인 것 count

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {

    var graph: [Int: [(v: Int, dist: Int)]] = [:]
    for r in road {
        let a = r[0]
        let b = r[1]
        let dist = r[2]
        graph[a, default: []].append((b, dist))
        graph[b, default: []].append((a, dist))
    }
    
    let INF = Int.max / 4
    var d = [Int](repeating: INF, count: N+1)
    d[1] = 0
    
    var pq = Heap<(v: Int, dist: Int)>(compare: { $0.dist < $1.dist })    
    pq.heapPush((1, 0))
    
    while !pq.isEmpty {
        let cur = pq.heapPop()!
        
        if d[cur.v] < cur.dist { continue }
        
        for e in graph[cur.v, default: []] {
            if d[cur.v] + e.dist < d[e.v] {
                d[e.v] = d[cur.v] + e.dist
                pq.heapPush((e.v, d[e.v]))
            }
        }
    }
    
    return d.filter { $0 <= k }.count
}

struct Heap<T> {
    var heap: [T] = []
    var compare: (T,T) -> Bool
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
        while curIdx > 1 && compare(heap[curIdx/2], heap[curIdx]) {
            heap.swapAt(curIdx, curIdx/2)
            curIdx /= 2
        }
    }
    
    mutating func heapPop() -> T? {
        if heap.count < 2 { return nil }
        if heap.count == 2 { return heap.removeLast() }
        
        let result = heap[1]
        heap.swapAt(1, heap.count-1)
        heap.removeLast()
        swimDown(1)
        return result
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
