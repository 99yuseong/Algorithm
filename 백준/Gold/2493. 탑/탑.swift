import Foundation

let n = Int(readLine()!)!

var answer: [Int] = Array(repeating: 0, count: n)
var towers = readLine()!.components(separatedBy: " ").map { Int($0)! }
var stack: [Int] = []

for i in (0..<n).reversed() {
    while !stack.isEmpty && towers[i] > towers[stack.last!] {
        let popped = stack.popLast()!
        answer[popped] = i + 1
    }
    stack.append(i)
}

print(answer.map { String($0) }.joined(separator: " "))
