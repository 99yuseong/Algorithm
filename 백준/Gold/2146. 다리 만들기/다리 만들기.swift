let N = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}

// 일단 다른 섬인 것을 구분해야함
// 섬마다 돌면서 영역 표시
// 영역별 BFS -> 다른 영역 최소도달 저장
var queue: [[Int]] = []
var areaStartPoints: [[Int]] = []
var areaMark = 2
var minDistance = Int.max
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 1 {
            queue.append([i,j])
            map[i][j] = areaMark
            areaStartPoints.append([i,j])
            markArea()
            areaMark += 1
        }
    }
}

for startPoint in areaStartPoints {
    let distance = calculateMinDistance(areaMark: map[startPoint[0]][startPoint[1]])
    minDistance = min(distance, minDistance)
}

print(minDistance)

func calculateMinDistance(areaMark: Int) -> Int {
    queue = []
    var distance = 0
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    
    for i in 0..<N {
        for j in 0..<N {
            if map[i][j] == areaMark {
                queue.append([i,j,0])
                visited[i][j] = true
            }
        }
    }
    
    out: while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            guard 0..<N ~= x && 0..<N ~= y else { continue }
            
            if !visited[x][y] && map[x][y] != 0 && map[x][y] != areaMark {
                distance = cur[2]
                break out
            }
            
            if !visited[x][y] && map[x][y] == 0 {
                queue.append([x,y,cur[2]+1])
                visited[x][y] = true
            }
        }
    }
    
    return distance
}

func markArea() {
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if 0..<N ~= x && 0..<N ~= y && map[x][y] == 1 {
                queue.append([x,y])
                map[x][y] = areaMark
            }
        }
    }
}
