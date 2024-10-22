let input = readLine()!.split(separator: " ").map { Int($0)! }
let M = input[0]
let N = input[1]
let K = input[2]

var paper = Array(repeating: Array(repeating: 0, count: N), count: M)

for _ in 0..<K {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let minX = min(input[0], input[2])
    let maxX = max(input[0], input[2])
    let minY = min(input[1], input[3])
    let maxY = max(input[1], input[3])
    
    for x in minX..<maxX {
        for y in minY..<maxY {
            paper[y][x] = 1
        }
    }
}

var areas: [Int] = []
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var queue: [[Int]] = []

for i in 0..<M {
    for j in 0..<N {
        if paper[i][j] == 0 {
            var area = 1
            paper[i][j] = 2
            queue.append([i,j])
            
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                
                for k in 0..<4 {
                    let x = cur[0] + dx[k]
                    let y = cur[1] + dy[k]
                    
                    if 0..<M ~= x && 0..<N ~= y && paper[x][y] == 0 {
                        queue.append([x,y])
                        paper[x][y] = 1
                        area += 1
                    }
                }
            }
            areas.append(area)
        }
    }
}
print(areas.count)
print(areas.sorted().map { String($0) }.joined(separator: " "))
