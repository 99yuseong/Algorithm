import Foundation

var stack: [Int] = []

let n = Int(readLine()!)!

for _ in 0..<n {
    let num = Int(readLine()!)!
    if num == 0 {
        stack.popLast()
    } else {
        stack.append(num)
    }
}

print(stack.reduce(0, +))