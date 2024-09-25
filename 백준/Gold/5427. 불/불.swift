import Foundation

struct Q<T: Equatable> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { inbox.isEmpty && outbox.isEmpty }
    mutating func enqueue(_ value: T) { inbox.append(value) }
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

let N = Int(readLine()!)!

out: for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let my = input[0]
    let mx = input[1]
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    var map = Array(repeating: Array(repeating: "", count: my), count: mx)
    var visited = Array(repeating: Array(repeating: -1, count: my), count: mx)
    var sPos: [Int] = []
    var queue = Q<[Int]>()
    
    for i in 0..<mx {
        let line = readLine()!.map { String($0) }
        for (j, item) in line.enumerated() {
            map[i][j] = item
            if item == "@" {
                sPos = [i,j]
                visited[i][j] = 0
            }
            if item == "*" {
                queue.enqueue([i,j])
                visited[i][j] = 1
            }
            if item == "." {
                visited[i][j] = 0
            }
        }
    }
    
    while !queue.isEmpty {
        let cur = queue.dequeue()!
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if 0..<mx ~= x && 0..<my ~= y && visited[x][y] == 0 {
                queue.enqueue([x,y])
                visited[x][y] = visited[cur[0]][cur[1]] + 1
            }
        }
    }
    
    queue.enqueue(sPos)
    visited[sPos[0]][sPos[1]] = 1
    
    while !queue.isEmpty {
        let cur = queue.dequeue()!
        
        if cur[0] == 0 || cur[0] == mx-1 || cur[1] == 0 || cur[1] == my-1 {
            print(visited[cur[0]][cur[1]])
            continue out
        }
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if 0..<mx ~= x
                && 0..<my ~= y
                && (visited[x][y] == 0 || visited[x][y] > visited[cur[0]][cur[1]] + 1)
            {
                queue.enqueue([x,y])
                visited[x][y] = visited[cur[0]][cur[1]] + 1
            }
        }
    }
    
    print("IMPOSSIBLE")
}
