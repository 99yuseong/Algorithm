import Foundation

let n = Int(readLine()!)!
var hist: [Int] = []

for _ in 0..<n {
    hist.append(Int(readLine()!)!)
}

var stack: [Int] = []
var maxArea: Int = 0

for i in 0..<n {
    while !stack.isEmpty && hist[stack.last!] > hist[i] {
        let remove = stack.popLast()!
        let width = stack.isEmpty ? i : i - stack.last! - 1
        maxArea = max(maxArea, width * hist[remove])
    }
    stack.append(i)
}

while !stack.isEmpty {
    let remove = stack.popLast()!
    let width = stack.isEmpty ? n : n - stack.last! - 1
    maxArea = max(maxArea, width * hist[remove])
}

print(maxArea)


