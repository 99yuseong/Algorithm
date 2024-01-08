import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

let n: Int = input[0]
let k: Int = input[1]

struct Queue {
    var data: [Int] = []
    var index: Int = 0

    var count: Int {
        return data.count - index
    }
    
    mutating func push(_ n: Int) {
        data.append(n)
    }

    mutating func pop() -> Int {
        defer {
            index += 1
        }
        return data[index]
    }
}

var queue = Queue()
var result: [Int] = []
for i in 1...n {
    queue.push(i)
}

while queue.count != 0 {
    for _ in 0..<k-1 {
        queue.push(queue.pop())
    }
    result.append(queue.pop())
}

print("<\(result.map { String($0) }.joined(separator: ", "))>")
