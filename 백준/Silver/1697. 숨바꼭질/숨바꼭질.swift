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
var subin = input[0]
let sis = input[1]

var queue = Q<[Int]>()
var times = Array(repeating: 0, count: 100001)
queue.append([subin, 0])

while !queue.isEmpty {
    let cur = queue.removeFirst()!
    let pos = cur[0]
    let time = cur[1]
    
    if pos == sis {
        print(time)
        exit(0)
    }
    
    let moves = [pos - 1, pos + 1, pos * 2]
    
    for move in moves {
        guard 0..<100001 ~= move else { continue }
        guard times[move] == 0 else { continue }
        times[move] = time + 1
        queue.append([move, time + 1])
    }
}
