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
    arr.append(Array(readLine()!).map { Int(String($0))! })
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var queue = Q<[Int]>()
var visited = Array(repeating: Array(repeating: Array(repeating: -1, count: 2), count: m), count: n)

queue.append([0,0,0]) // x, y, Breaked
visited[0][0][0] = 1

while !queue.isEmpty {
    let cur = queue.popFirst()!
    
    if cur[0] == n-1 && cur[1] == m-1 {
        print(visited[cur[0]][cur[1]][cur[2]])
        exit(0)
    }
    
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        
        guard 0..<n ~= x && 0..<m ~= y else { continue }
        if arr[x][y] == 0 && visited[x][y][cur[2]] == -1 {
            queue.append([x, y, cur[2]])
            visited[x][y][cur[2]] = visited[cur[0]][cur[1]][cur[2]] + 1
        } else if cur[2] == 0 && arr[x][y] == 1 {
            queue.append([x, y, 1])
            visited[x][y][1] = visited[cur[0]][cur[1]][cur[2]] + 1
        }
    }
}
    
print(-1)
