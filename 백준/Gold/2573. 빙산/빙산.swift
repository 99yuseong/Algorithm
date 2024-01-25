import Foundation

struct Q<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    mutating func append(_ x: T) {
        inbox.append(x)
    }
    mutating func popFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var arr: [[Int]] = []
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func numIsland() -> Int {
    var queue = Q<[Int]>()
    var visited = Array(repeating: Array(repeating: -1, count: m), count: n)
    var island = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] != 0 && visited[i][j] == -1 {
                queue.append([i, j])
                visited[i][j] = 0
                island += 1
                
                while !queue.isEmpty {
                    let cur = queue.popFirst()!
                    
                    for k in 0..<4 {
                        let x = cur[0] + dx[k]
                        let y = cur[1] + dy[k]
                        
                        guard 0..<n ~= x && 0..<m ~= y else { continue }
                        if arr[x][y] != 0 && visited[x][y] == -1 {
                            queue.append([x,y])
                            visited[x][y] = 0
                        }
                    }
                }
            }
        }
    }
    
    return island
}

func melting() {
    var melting = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] != 0 {
                for k in 0..<4 {
                    let x = i + dx[k]
                    let y = j + dy[k]
                    
                    guard 0..<n ~= x && 0..<m ~= y else { continue }
                    if arr[x][y] == 0 { melting[i][j] += 1 }
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            arr[i][j] = max(arr[i][j] - melting[i][j], 0)
        }
    }
}

var year = 0
while true {
    let island = numIsland()
    
    if island >= 2 {
        print(year)
        break
    } else if island == 0 {
        print(0)
        break
    }
    
    melting()
    year += 1
}
