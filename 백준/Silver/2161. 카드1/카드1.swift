import Foundation

struct Q<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    
    public var isEmpty: Bool {
        inbox.isEmpty && outbox.isEmpty
    }
    
    public var count: Int {
        inbox.count + outbox.count
    }
    
    mutating public func enqueue(_ data: T) {
        inbox.append(data)
    }
    
    mutating public func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
    
    public func front() -> T? {
        outbox.isEmpty ? inbox.first : outbox.last
    }
    
    public func back() -> T? {
        inbox.isEmpty ? outbox.last : inbox.first
    }
}

let N = Int(readLine()!)!
var queue = Q<Int>()
var result = ""

(1...N).forEach { queue.enqueue($0) }

while !queue.isEmpty {
    result += "\(queue.dequeue()!) "
    if !queue.isEmpty {
        queue.enqueue(queue.dequeue()!)
    }
}
print(result)
