import Foundation

struct Pair {
    let height: Int
    var count: Int
    
    mutating func countUp(_ n: Int) {
        self.count += n
    }
}

var stack = [Pair]()
var result: Int = 0

let N = Int(readLine()!)!
for _ in 0..<N {
    var pair = Pair(height: Int(readLine()!)!, count: 1)
    
    while !stack.isEmpty && stack.last!.height <= pair.height {
        result += stack.last!.count
        
        if stack.last!.height == pair.height {
            pair.countUp(stack.last!.count)
        }
        _ = stack.popLast()
    }
    
    if !stack.isEmpty {
        result += 1
    }
    stack.append(pair)
}

print(result)
