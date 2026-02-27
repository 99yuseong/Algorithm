// 방향이 없는 그래프
// 연결 요소의 개수

struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { return inbox.isEmpty && outbox.isEmpty }
    mutating func append(_ k: T) { inbox.append(k) }
    mutating func removeFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func solution(_ v: Int, _ e: Int, _ graph: [Int: [Int]]) -> Int {
    // 덩어리 개수를 세라.
    var visited = [Bool](repeating: false, count: v+1)
    var connected = 0
    var queue = Queue<Int>()
    for i in 1...v {
        if !visited[i] {
            queue.append(i)
            while !queue.isEmpty {
                let cur = queue.removeFirst()!
                for v in (graph[cur] ?? []) {
                    if !visited[v] {
                        queue.append(v)
                        visited[v] = true
                    }
                }
            }
            connected += 1
        }
    }
    return connected
}

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0] // V : 1~1000
let M = NM[1] // E : 최대 100만개 정도
var graph: [Int: [Int]] = [:]
for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u = uv[0]
    let v = uv[1]
    graph[u, default: []].append(v)
    graph[v, default: []].append(u)
}
print(solution(N, M, graph))
