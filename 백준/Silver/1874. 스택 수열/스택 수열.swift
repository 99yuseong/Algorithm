import Foundation

let n = Int(readLine()!)!
var stack: [Int] = []
var result: [String] = []
var curValue = 1

for _ in 0..<n {
    let input = Int(readLine()!)!
    
    while curValue <= input {
        stack.append(curValue)
        result.append("+")
        curValue += 1
    }
    
    if stack.last == input {
        _ = stack.popLast()
        result.append("-")
    } else {
        print("NO")
        exit(0)
    }
}

print(result.joined(separator: "\n"))
