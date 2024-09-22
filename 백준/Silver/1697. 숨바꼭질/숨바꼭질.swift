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

switch N {
case let x where x < K:
    print(BFS()!)
case let x where x > K:
    print(N-K)
case let x where x == K:
    print(0)
default:
    break
}

func BFS() -> Int? {
    var map = Array(repeating: 0, count: 100001)
    var queue = Q<Int>()

    map[K] = -1
    queue.enqueue(N)

    while !queue.isEmpty {
        let cur = queue.dequeue()!
        
        for x in [cur-1, cur+1, cur*2] {
            guard (0..<100001) ~= x else { continue }
            
            if map[x] == -1 { return map[cur] + 1 }
            
            if map[x] == 0 {
                queue.enqueue(x)
                map[x] = map[cur] + 1
            }
        }
    }
    return nil
}
