// N*M 미로
// 빈방 or 벽
// 벽을 부서야함

// 1,1에서 n.m으로 가려면 몇개의 벽을 부서야하난가?
// 벽을 부수는 비용 > 1:0

// 100*100칸
// V = 100, E = 400
// (x, y) -> (i, j) cost: k

// 1. graph로 변환
// 2. dijkstra 처리
struct Heap<T> {
    var heap: [T] = []
    var compare: (T,T) -> Bool
    init(compare: @escaping (T,T) -> Bool) {
        self.compare = compare
    }
    var isEmpty: Bool { return heap.count < 2 }
    mutating func heapPush(_ k: T) {
        if heap.count == 0 {
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
            let leftIdx = targetIdx * 2
            let rightIdx = targetIdx * 2 + 1
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

func solution(_ map: [[Int]]) -> Int {
    
    let n = map.count
    let m = map[0].count
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var graph: [String: [(x: Int, y: Int, c: Int)]] = [:]
    
    for i in 0..<n {
        for j in 0..<m {
            for k in 0..<4 {
                let x = i + dx[k]
                let y = j + dy[k]
                
                if 0..<n ~= x && 0..<m ~= y {
                    graph["\(i) \(j)", default: []].append((x, y, map[x][y]))
                }
            }
        }
    }
    
    // dijkstra 최단 거리는 무엇?
    // 0,0 > n-1,m-1
    let INF = Int.max/4
    
    var D = [[Int]](repeating: [Int](repeating: INF, count: m), count: n)
    var pq = Heap<(x: Int, y: Int, c: Int)>(compare: { $0.c < $1.c })

    D[0][0] = 0
    pq.heapPush((0, 0, 0))
    
    while !pq.isEmpty {
        let cur = pq.heapPop()!
        
        if D[cur.x][cur.y] < cur.c { continue }
        
        for (x, y, c) in graph["\(cur.x) \(cur.y)", default: []] {
            if D[cur.x][cur.y] + c < D[x][y] {
                D[x][y] = D[cur.x][cur.y] + c
                pq.heapPush((x, y, D[x][y]))
            }
        }
    }
    
    return D[n-1][m-1]
}
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = NM[0]
let N = NM[1]
var map = [[Int]]()
for _ in 0..<N {
    map.append(Array(readLine()!).map { Int(String($0))! })
}
print(solution(map))