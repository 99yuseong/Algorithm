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

let T = Int(readLine()!)!
let dx = [-2, -2, -1, -1, 1, 1, 2, 2]
let dy = [-1, 1, -2, 2, -2, 2, -1, 1]

for _ in 0..<T {
    let I = Int(readLine()!)!
    var times = Array(repeating: Array(repeating: -1, count: I), count: I)
    let cur = readLine()!.split(separator: " ").map { Int($0)! }
    let target = readLine()!.split(separator: " ").map { Int($0)! }
    
    var queue = Q<[Int]>()
    queue.append(cur)
    times[cur[0]][cur[1]] = 0
    
    while !queue.isEmpty {
        let cur = queue.popFirst()!
        
        for i in 0..<8 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if cur == target {
                print(times[cur[0]][cur[1]])
                break
            }
            
            if 0..<I ~= x && 0..<I ~= y && times[x][y] == -1 {
                queue.append([x, y])
                times[x][y] = times[cur[0]][cur[1]] + 1
            }
        }
    }
}
