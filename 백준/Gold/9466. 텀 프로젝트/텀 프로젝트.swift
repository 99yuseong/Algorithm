let T = Int(readLine()!)! // 10만

for _ in 0..<T {
    let N = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    var visited = Array(repeating: -1, count: N)
    
    out: for i in 0..<N {
        if visited[i] == -1 {
            var curIdx = i
            
            while true {
                visited[curIdx] = i
                curIdx = arr[curIdx]
                
                if visited[curIdx] == i {
                    while visited[curIdx] != -2 {
                        visited[curIdx] = -2
                        curIdx = arr[curIdx]
                    }
                    continue out
                } else if visited[curIdx] != -1 {
                    continue out
                }
            }
        }
    }
    
    var answer = 0
    for j in 0..<N {
        if visited[j] != -2 {
            answer += 1
        }
    }
    print(answer)
}
