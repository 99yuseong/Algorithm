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

let line = readLine()!.split(separator: " ").map { Int($0)! }

let mz = line[0] // 최대 100 // m
let my = line[1] // 최대 100 // n
let mx = line[2] // 최대 100 // h

// 1 - 익은 토마토
// 0 - 익지 않은 토마토
// -1 - 토마토 없음
var box: [[[Int]]] = []

for _ in 0..<mx {
    var layer: [[Int]] = []
    for _ in 0..<my {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        layer.append(line)
    }
    box.append(layer)
}

var queue = Q<[Int]>()

var time = 0
let dx = [0, 0, 1, -1, 0, 0]
let dy = [0, 1, 0, 0, -1, 0]
let dz = [1, 0, 0, 0, 0, -1]

for i in 0..<mx {
    for j in 0..<my {
        for k in 0..<mz {
            if box[i][j][k] == 1 {
                queue.enqueue([i,j,k])
            }
        }
    }
}

while !queue.isEmpty {
    let cur = queue.dequeue()!
    
    for i in 0..<6 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        let z = cur[2] + dz[i]
        
        if
            (0..<mx) ~= x
            && (0..<my) ~= y
            && (0..<mz) ~= z
            && box[x][y][z] == 0
        {
            queue.enqueue([x,y,z])
            box[x][y][z] = box[cur[0]][cur[1]][cur[2]] + 1
            time = max(box[cur[0]][cur[1]][cur[2]], time)
        }
    }
}

for i in 0..<mx {
    for j in 0..<my {
        for k in 0..<mz {
            if box[i][j][k] == 0 {
                print(-1)
                exit(0)
            }
        }
    }
}

print(time)
