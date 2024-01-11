import Foundation

let input = Array(readLine()!)
var stack: [Character] = []
var answer = 0

for i in 0..<input.count {
    if input[i] == "(" {
        stack.append(input[i])
    } else {
        stack.removeLast()
        answer += input[i-1] == "(" ? stack.count : 1
    }
}

print(answer)
