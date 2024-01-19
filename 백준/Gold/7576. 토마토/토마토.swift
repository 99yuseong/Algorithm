import Foundation

struct Q<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    mutating func popFirst() -> T {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()!
    }
    
    mutating func append(_ item: T) {
        inbox.append(item)
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[1]
let m = input[0]

var arr: [[Int]] = []
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var queue = Q<[Int]>()
var maxDay = 0

for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 1 {
            queue.append([i, j])
        }
    }
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

while !queue.isEmpty {
    let cur = queue.popFirst()
    let day = arr[cur[0]][cur[1]]
    
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        
        if 0..<n ~= x && 0..<m ~= y && arr[x][y] == 0 {
            queue.append([x,y])
            arr[x][y] = day + 1
            maxDay = max(maxDay, day)
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 0 {
            print(-1)
            exit(0)
        }
    }
}

print(maxDay)

