import Foundation

class Queue {
    var inBox: [Int] = []
    var outBox: [Int] = []
    
    var isEmpty: Bool { inBox.isEmpty && outBox.isEmpty }
    var count: Int { inBox.count + outBox.count }
    var front: Int? {
        outBox.isEmpty ? inBox.first : outBox.last
    }
    var back: Int? {
        inBox.isEmpty ? outBox.first : inBox.last
    }
    
    func enqueue(_ value: Int) {
        inBox.append(value)
    }
    
    func dequeue() -> Int? {
        if outBox.isEmpty {
            outBox = inBox.reversed()
            inBox.removeAll()
        }
        return outBox.popLast()
    }
}

let N = Int(readLine()!)!
var queue = Queue()

for _ in 0..<N {
    let cmd = readLine()!.split(separator: " ")
    
    switch cmd.first! {
    case "push":
        queue.enqueue(Int(cmd.last!)!)
    case "pop":
        print(queue.dequeue() ?? -1)
    case "size":
        print(queue.count)
    case "empty":
        print(queue.isEmpty ? 1 : 0)
    case "front":
        print(queue.front ?? -1)
    case "back":
        print(queue.back ?? -1)
    default:
        break
    }
}
