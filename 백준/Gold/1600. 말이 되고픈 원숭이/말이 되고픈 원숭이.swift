import Foundation

let K = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
let my = input.first!
let mx = input.last!
var map: [[Int]] = []
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: K+1), count: my), count: mx)
var queue: [[Int]] = []

for _ in 0..<mx {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

queue.append([0,0,0])
visited[0][0][0] = true
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
let hx = [2,2,1,1,-1,-1,-2,-2]
let hy = [1,-1,2,-2,2,-2,1,-1]

while !queue.isEmpty {
    let cur = queue.removeFirst()
    
    if cur[0] == mx-1 && cur[1] == my-1 {
        print(map[mx-1][my-1] * (-1))
        exit(0)
    }
    
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        
        if 0..<mx ~= x
            && 0..<my ~= y
            && !visited[x][y][cur[2]]
            && map[x][y] <= 0
        {
            queue.append([x,y,cur[2]])
            visited[x][y][cur[2]] = true
            map[x][y] = map[cur[0]][cur[1]] - 1
        }
    }
    
    if cur[2] < K {
        for i in 0..<8 {
            let x = cur[0] + hx[i]
            let y = cur[1] + hy[i]
            
            if 0..<mx ~= x
                && 0..<my ~= y
                && !visited[x][y][cur[2]+1]
                && map[x][y] <= 0
            {
                queue.append([x,y,cur[2]+1])
                visited[x][y][cur[2]+1] = true
                map[x][y] = map[cur[0]][cur[1]] - 1
            }
        }
    }
}

print(-1)
