import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let mx = input.first!
let my = input.last!

var map = Array(repeating: Array(repeating: -1, count: my), count: mx)
var visited = Array(repeating: Array(repeating: -1, count: my), count: mx)
var queue: [[Int]] = []
var jPos: [Int] = []

for i in 0..<mx {
    let line = String(readLine()!)
    
    for (j, item) in line.enumerated() {
        switch item {
        case "F":
            queue.append([i,j])
        case "J":
            map[i][j] = 0
            jPos = [i,j]
        case ".":
            map[i][j] = 0
        default: // #
            break
        }
    }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

// 불이 지나간 자리를 먼저 BFS로 순환 -> Map에 불이 번지는 데 걸리는 시간 저장
while !queue.isEmpty {
    let cur = queue.removeFirst()
    let time = max(map[cur[0]][cur[1]], 0) + 1
    
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        
        if (0..<mx) ~= x && (0..<my) ~= y && map[x][y] == 0 {
            queue.append([x,y])
            map[x][y] = time
        }
    }
}

queue.append(jPos)
visited[jPos[0]][jPos[1]] = 0

// 다음은 Visited에서
// 1. 방문하지 않은 visited[x][y] == -1
// 2. 불이 붙지 않거나 늦게 붙는 map[x][y] == 0 || map[x][y] > time
// 구역을 돌면서
// x, y 좌표가 구역을 벗어나는 순간을 확인
// if x < 0 || x > mx-1 || y < 0 || y > my-1
while !queue.isEmpty {
    let cur = queue.removeFirst()
    let time = visited[cur[0]][cur[1]] + 1
    
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        
        if x < 0 || x > mx-1 || y < 0 || y > my-1 {
            print(time)
            exit(0)
        }
        
        if (0..<mx) ~= x && (0..<my) ~= y
            && visited[x][y] == -1
            && (map[x][y] == 0 || map[x][y] > time
        ) {
            queue.append([x,y])
            visited[x][y] = time
        }
    }
}

print("IMPOSSIBLE")
