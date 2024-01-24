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
    
    mutating func removeFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0]
let n = input[1]
let h = input[2]
var arr: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: -1, count: m), count: n), count: h)

for k in 0..<h {
    for i in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        arr[k][i] = line
    }
}

var queue = Q<[Int]>()
let dx = [0, 0, 0, 0, -1, 1]
let dy = [0, 0, -1, 1, 0, 0]
let dz = [-1, 1, 0, 0, 0, 0]
var result = 0

for i in 0..<n {
    for j in 0..<m {
        for k in 0..<h {
            if arr[k][i][j] == 1 {
                queue.append([i, j, k])
            }
        }
    }
}

while !queue.isEmpty {
    let cur = queue.removeFirst()!
    let time = arr[cur[2]][cur[0]][cur[1]]
    
    for a in 0..<6 {
        let x = cur[0] + dx[a]
        let y = cur[1] + dy[a]
        let z = cur[2] + dz[a]
        
        if 0..<n ~= x && 0..<m ~= y && 0..<h ~= z && arr[z][x][y] == 0 {
            queue.append([x,y,z])
            arr[z][x][y] = time + 1
            result = max(result, time)
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        for k in 0..<h {
            if arr[k][i][j] == 0 {
                print(-1)
                exit(0)
            }
        }
    }
}

print(result)
