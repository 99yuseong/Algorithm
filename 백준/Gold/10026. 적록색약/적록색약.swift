import Foundation

let n = Int(readLine()!)!
var arr: [[Character]] = []
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

for _ in 0..<n {
    arr.append(Array(readLine()!))
}

func bfs(_ isNormal: Bool) -> Int {
    var section = 0
    var queue: [[Int]] = []
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] {
                let sec = arr[i][j]
                section += 1
                    
                queue.append([i, j])
                visited[i][j] = true
                
                while !queue.isEmpty {
                    let cur = queue.removeFirst()
                            
                    for i in 0..<4 {
                        let x = cur[0] + dx[i]
                        let y = cur[1] + dy[i]
                          
                        if 0..<n ~= x && 0..<n ~= y && !visited[x][y] {
                            switch arr[x][y] {
                            case sec:
                                break
                            default:
                                if !isNormal && sec != "B" && arr[x][y] != "B" {
                                    break
                                }
                                continue
                            }
                            queue.append([x, y])
                            visited[x][y] = true
                        }
                    }
                }
            }
        }
    }
    
    return section
}

print("\(bfs(true)) \(bfs(false))")
