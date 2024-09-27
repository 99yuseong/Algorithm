let input = readLine()!.split(separator: " ").map { Int($0)! }
let mx = input[0]
let my = input[1]
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
var map: [[Int]] = []
var countsZero = Array(repeating: Array(repeating: 0, count: my), count: mx)
var ices: [[Int]] = []
var count = 0
var time = 0

for _ in 0..<mx {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func melt() {
    while !ices.isEmpty {
        let ice = ices.removeLast()
        map[ice[0]][ice[1]] = max(map[ice[0]][ice[1]]-countsZero[ice[0]][ice[1]], 0)
    }
}

func countZeros() {
    for i in 0..<mx {
        for j in 0..<my {
            if map[i][j] != 0 {
                var nearZero = 0
                for k in 0..<4 {
                    let x = i + dx[k]
                    let y = j + dy[k]
                    
                    if map[x][y] == 0 {
                        nearZero += 1
                    }
                }
                ices.append([i,j])
                countsZero[i][j] = nearZero
            }
        }
    }
}

while true {
    count = countMap()
    if count >= 2 {
        print(time)
        break
    } else if count == 0 {
        print(0)
        break
    } else if count == 1 {
        countZeros()
        melt()
    }
    time += 1
}


func countMap() -> Int {
    var count = 0
    var visited = Array(repeating: Array(repeating: false, count: my), count: mx)
    var queue: [[Int]] = []
    
    for i in 0..<mx {
        for j in 0..<my {
            if !visited[i][j] && map[i][j] != 0 {
                queue.append([i,j])
                visited[i][j] = true
                
                while !queue.isEmpty {
                    let cur = queue.removeFirst()
                    
                    for i in 0..<4 {
                        let x = cur[0] + dx[i]
                        let y = cur[1] + dy[i]
                        
                        if !visited[x][y] && map[x][y] > 0 {
                            visited[x][y] = true
                            queue.append([x,y])
                        }
                    }
                }
                
                count += 1
            }
        }
    }
    return count
}
