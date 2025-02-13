import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    // 연결된 네트워크 개수를 세라
    // n: 1~200 자연수
    // BFS -> O(N)
    
    var queue: [(cur: Int, connected: [Int])] = []
    var visited = Array(repeating: false, count: n)
    var count = 0
    
    for i in 0..<n {
        if !visited[i] {
            queue.append((cur: i, connected: computers[i]))
            visited[i] = true
            count += 1
            
            while !queue.isEmpty {
                let (cur, connected) = queue.removeFirst()
        
                for i in 0..<connected.count {
                    if connected[i] == 1 && i != cur && !visited[i] {
                        queue.append((cur: i, connected: computers[i]))
                        visited[i] = true
                    }
                }
            }
        }
    }
    
    return count
}

