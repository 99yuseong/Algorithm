import Foundation
// x-1 x+1 x*2
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

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input.first!
let K = input.last!

if N == K {
    print(0)
    exit(0)
} else if N > K {
    print(N-K)
    exit(0)
}

var queue = Q<[Int]>()
var visited = Array(repeating: false, count: 200001)

queue.enqueue([N,0])
visited[N] = true

while !queue.isEmpty {
    let cur = queue.dequeue()!
    
    if cur[0] == K {
        print(cur[1])
        exit(0)
    }
    
    if 0..<200001 ~= cur[0]-1 && !visited[cur[0]-1] {
        queue.enqueue([cur[0]-1,cur[1]+1])
        visited[cur[0]-1] = true
    }
    
    if 0..<200001 ~= cur[0]*2 && !visited[cur[0]*2] {
        queue.enqueue([cur[0]*2,cur[1]])
        visited[cur[0]*2] = true
    }
    
    if 0..<200001 ~= cur[0]+1 && !visited[cur[0]+1] {
        queue.enqueue([cur[0]+1,cur[1]+1])
        visited[cur[0]+1] = true
    }
}
