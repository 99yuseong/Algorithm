import Foundation

let input = Array(readLine()!)
var stack: [Character] = []
var tmp = 1
var answer = 0
var isError = false

for i in 0..<input.count {
    if input[i] == "(" || input[i] == "[" {
        tmp *= input[i] == "(" ? 2 : 3
        stack.append(input[i])
    } else {
        if stack.isEmpty {
            isError = true
            break
        } else if stack.last! == "(" && input[i] == ")" {
            if input[i-1] == "(" {
                answer += tmp
            }
            tmp /= 2
            stack.popLast()
        } else if stack.last! == "[" && input[i] == "]" {
            if input[i-1] == "[" {
                answer += tmp
            }
            tmp /= 3
            stack.popLast()
        } else {
            isError = true
            break
        }
    }
}

if isError || !stack.isEmpty {
    print(0)
} else {
    print(answer)
}
