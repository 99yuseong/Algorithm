import Foundation

let n = Int(readLine()!)!

var count: Int = 1
var stack: [Int] = []
var command: [String] = []

for _ in 0..<n {
    let num = Int(readLine()!)!
    
    while count <= num {
        stack.append(count)
        command.append("+")
        count += 1
    }
    
    if stack.last == num {
        stack.popLast()
        command.append("-")
    } else {
        print("NO")
        exit(0)
    }
}

print(command.joined(separator: "\n"))
