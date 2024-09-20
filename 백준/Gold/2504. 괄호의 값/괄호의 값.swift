import Foundation

let input = Array(readLine()!)
var stack: [Character] = []
var answer = 0
var cal = 1

for i in 0..<input.count {
    switch input[i] {
    case "(":
        stack.append("(")
        cal *= 2
    case "[":
        stack.append("[")
        cal *= 3
    case ")":
        if !stack.isEmpty && stack.last! == "(" {
            if input[i-1] == "(" {
                answer += cal
            }
            cal /= 2
            _ = stack.popLast()
        } else {
            print(0)
            exit(0)
        }
    case "]":
        if !stack.isEmpty && stack.last! == "[" {
            if input[i-1] == "[" {
                answer += cal
            }
            cal /= 3
            _ = stack.popLast()
        } else {
            print(0)
            exit(0)
        }
    default:
        break
    }
}
print(stack.isEmpty ? answer : 0)
