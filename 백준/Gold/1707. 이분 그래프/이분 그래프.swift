// 각 집합이 속한 정점 // 이분 그래프
// DFS로 섬이 여러개냐 Yes or No
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

func solution(_ v: Int, _ uv: [[Int]]) -> String {

    var graph: [Int: [Int]] = [:]
    for v in uv {
        graph[v[0], default: []].append(v[1])
        graph[v[1], default: []].append(v[0])
    }
    
    var visited = [Int](repeating: 0, count: v+1)
    
    for i in 1...v {
        if visited[i] == 0 {       
            var queue = Queue<Int>()
            queue.append(i)
            visited[i] = 1
            
            while !queue.isEmpty {
                let cur = queue.removeFirst()!
                for v in graph[cur, default: []] {
                    if visited[v] == 0 {
                        queue.append(v)
                        visited[v] = visited[cur] * (-1)
                    } else if visited[v] == visited[cur] {
                        return "NO"
                    }
                }
            }
        }
    }
    return "YES"
}

let K = Int(readLine()!)!
for _ in 0..<K {
    let VE = readLine()!.split(separator: " ").map { Int(String($0))! }
    let V = VE[0]
    let E = VE[1]
    var UV = [[Int]]()
    for _ in 0..<E {
        UV.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    print(solution(V, UV))
}
