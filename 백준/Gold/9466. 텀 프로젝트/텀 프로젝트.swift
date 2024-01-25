import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    
    var visited = Array(repeating: -1, count: n)
    var count = n
    
    out: for i in 0..<n {
        if visited[i] == -1 { // -1 : not visited
            var cur = i
            
            while true {
                visited[cur] = i // cur cycle
                cur = arr[cur]
                
                if visited[cur] == i {
                    while visited[cur] != -2 { // -2 : cycle-in
                        visited[cur] = -2
                        cur = arr[cur]
                    }
                    continue out
                }
                if visited[cur] != -1 {
                    continue out
                }
            }
        }
    }
    
    var result = 0
    for i in 0..<n {
        if visited[i] != -2 {
            result += 1
        }
    }
    
    print(result)
}
