import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let mx = input[0]
let my = input[1]
let dx = [1, 0, -1, 0]
let dy = [0, -1, 0, 1]

var pictures: [[Int]] = []
var picNum = 0
var maxArea = 0

for _ in 0..<mx {
    pictures.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<mx {
    for j in 0..<my {
        if pictures[i][j] == 1 {
            let area = bfs(i, j)
            picNum += 1
            maxArea = max(maxArea, area)
        }
    }
}

func bfs(_ sx: Int, _ sy: Int) -> Int {
    var area = 1
    pictures[sx][sy] = 0
    
    var queue: [[Int]] = []
    queue.append([sx,sy])

    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if (0..<mx) ~= x && (0..<my) ~= y && pictures[x][y] == 1 {
                queue.append([x, y])
                pictures[x][y] = 0
                area += 1
            }
        }
    }
    
    return area
}

print(picNum)
print(maxArea)



