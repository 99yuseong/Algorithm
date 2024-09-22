// N -> 십만
// K -> 십만
// 걸으면 앞뒤 +- 1
// 순간이동 * 2
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

// N < K 인경우
// 상황별 모든 케이스에서 가장 먼저 K에 도달하는 경우가 Win
var map = Array(repeating: 0, count: 100001)
var queue = Q<Int>()

map[K] = -1
queue.enqueue(N)

while !queue.isEmpty {
    let cur = queue.dequeue()!

    let xs = [cur-1, cur+1, cur*2]
    
    for x in xs {
        guard (0..<100001) ~= x else { continue }
        
        if map[x] == -1 {
            print(map[cur] + 1)
            exit(0)
        }
        
        if map[x] == 0 {
            queue.enqueue(x)
            map[x] = map[cur] + 1
        }
    }
}
