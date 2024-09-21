import Foundation

// 지훈, 불 동시 이동
let input = readLine()!.split(separator: " ").map { Int($0)! }
let mx = input.first!
let my = input.last!

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var jPos: [Int] = []
var map: [[Int]] = Array(repeating: Array(repeating: -1, count: my), count: mx)
var visited: [[Int]] = Array(repeating: Array(repeating: -1, count: my), count: mx)

var queue: [[Int]] = []

for i in 0..<mx {
    let line = readLine()!.map { String($0) }
    
    for (j, item) in line.enumerated() {
        switch item {
        case "#":
            break
        case "J":
            map[i][j] = 0
            jPos = [i,j]
        case "F":
            queue.append([i,j])
        case ".":
            map[i][j] = 0
        default:
            break
        }
    }
}

// 불 Queue
while !queue.isEmpty {
    let cur = queue.removeFirst()
    let time = max(map[cur[0]][cur[1]], 0)
    
    for i in 0..<4 {
        let x = cur.first! + dx[i]
        let y = cur.last! + dy[i]
        
        if (0..<mx) ~= x && (0..<my) ~= y && map[x][y] == 0 {
            queue.append([x,y])
            map[x][y] = time + 1
        }
    }
}

queue.append(jPos)
visited[jPos[0]][jPos[1]] = 0
    
while !queue.isEmpty {
    let cur = queue.removeFirst()
    let time = visited[cur[0]][cur[1]] + 1
    
    for i in 0..<4 {
        let x = cur.first! + dx[i]
        let y = cur.last! + dy[i]
        
        if x < 0 || x > mx-1 || y < 0 || y > my-1 {
            print(time)
            exit(0)
        }
        
        if (0..<mx) ~= x && (0..<my) ~= y
            && visited[x][y] == -1
            && (map[x][y] == 0 || time < map[x][y])
        {
            queue.append([x,y])
            visited[x][y] = time
        }
    }
}

print("IMPOSSIBLE")
