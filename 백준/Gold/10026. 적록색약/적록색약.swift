func BFS(_ color: String) {
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if (0..<N) ~= x
                && (0..<N) ~= y
                && visited[x][y] == false
                && map[x][y] == color
            {
                queue.append([x,y])
                visited[x][y] = true
                map[x][y] = color == "B" ? "B" : "R"
            }
        }
    }
}

func BFS_True(_ color: String) {
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if (0..<N) ~= x
                && (0..<N) ~= y
                && map[x][y] == color {
                queue.append([x,y])
                map[x][y] = ""
            }
        }
    }
}

let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: "", count: N), count: N)
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

for i in 0..<N {
    let line = readLine()!.map { String($0) }
    map[i] = line
}

var queue: [[Int]] = []
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var isTrue = 0
var isFalse = 0

for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            let color = map[i][j]
            queue.append([i,j])
            visited[i][j] = true
            map[i][j] = color == "B" ? "B" : "R"
            BFS(color)
            isFalse += 1
        }
    }
}

for i in 0..<N {
    for j in 0..<N {
        if map[i][j] != "" {
            let color = map[i][j]
            queue.append([i,j])
            map[i][j] = ""
            BFS_True(color)
            isTrue += 1
        }
    }
}

print("\(isFalse) \(isTrue)")
