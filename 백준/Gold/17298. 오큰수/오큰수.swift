import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var answer = [Int](repeating: -1, count: n)
var stack: [Int] = []

for i in 0..<n {
    while !stack.isEmpty && array[stack.last!] < array[i] {
        answer[stack.removeLast()] = array[i]
    }
    stack.append(i)
}

print(answer.map { String($0) }.joined(separator: " "))