// 500 * 500 > 25000
// 0 -> 색칠 x, 1 -> 색칠 O
// 그림의 개수 & 그림의 넓이 출력

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let mx = nm.first!
let my = nm.last!

var pictures: [[Int]] = []
var count = 0
var maxArea = 0
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for _ in 0..<mx {
    pictures.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<mx {
    for j in 0..<my {
        if pictures[i][j] == 1 {
            maxArea = max(maxArea, BFS_MaxArea(i, j))
            count += 1
        }
    }
}
print(count)
print(maxArea)

func BFS_MaxArea(_ sx: Int, _ sy: Int) -> Int {
    var area = 1
    var queue: [[Int]] = []
    pictures[sx][sy] = 0
    
    queue.append([sx,sy])
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()

        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if (0..<mx) ~= x && (0..<my) ~= y && pictures[x][y] == 1 {
                pictures[x][y] = 0
                queue.append([x,y])
                area += 1
            }
        }
    }
    
    return area
}