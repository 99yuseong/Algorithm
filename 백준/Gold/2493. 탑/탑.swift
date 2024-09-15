import Foundation

let N = Int(readLine()!)!

var tower = readLine()!.split(separator: " ").map { Int($0)! }
var stack: [Int] = []
var result = Array(repeating: 0, count: tower.count)

for i in (0..<N).reversed() {
    while !stack.isEmpty && tower[i] >= tower[stack.last!] {
        result[stack.popLast()!] = i + 1
    }
    stack.append(i)
}

print(result.map { String($0) }.joined(separator: " "))
