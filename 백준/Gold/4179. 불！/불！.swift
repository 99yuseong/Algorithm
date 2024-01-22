import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var arr = Array(repeating: Array(repeating: -1, count: m), count: n)
var visited = Array(repeating: Array(repeating: -1, count: m), count: n)

var jPos: [Int] = []
var queue: [[Int]] = []

for i in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    
    for (j, item) in input.enumerated() {
        switch item {
        case "#":
            break
        case "J":
            jPos = [i, j]
            arr[i][j] = 0
        case "F":
            queue.append([i, j])
        default:
            arr[i][j] = 0
        }
    }
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let time = max(arr[cur[0]][cur[1]], 0)
    
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        
        if 0..<n ~= x && 0..<m ~= y && arr[x][y] == 0 {
            arr[x][y] = time + 1
            queue.append([x, y])
        }
    }
}

queue.append(jPos)
visited[jPos[0]][jPos[1]] = 0

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let time = visited[cur[0]][cur[1]] + 1
    
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
    
        if x < 0 || x >= n || y < 0 || y >= m {
            print(time)
            exit(0)
        }
        
        if 0..<n ~= x && 0..<m ~= y && visited[x][y] == -1 && (arr[x][y] == 0 || time < arr[x][y]) {
            visited[x][y] = time
            queue.append([x, y])
        }
    }
}

print("IMPOSSIBLE")
