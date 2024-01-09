import Foundation

let n = Int(readLine()!)!
var heights: [Int] = []
var stack: [Int] = []
var answer: Int = 0

for _ in 0..<n {
    let height = Int(readLine()!)!
    heights.append(height)
}
heights.append(Int.max)

for i in (0...n) {
    while !stack.isEmpty && heights[i] >= heights[stack.last!] {
        answer += i - stack.popLast()! - 1
    }
    stack.append(i)
}

print(answer)
