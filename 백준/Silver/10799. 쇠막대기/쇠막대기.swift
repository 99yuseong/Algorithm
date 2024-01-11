import Foundation

let input = readLine()!
var answer = 0
var stick = 0
var isLastClosed = false

for char in input {
    if char == "(" {
        stick += 1
        isLastClosed = false
    } else {
        stick -= 1
        if isLastClosed {
            answer += 1
        } else {
            answer += stick
        }
        isLastClosed = true
    }
}

print(answer)
