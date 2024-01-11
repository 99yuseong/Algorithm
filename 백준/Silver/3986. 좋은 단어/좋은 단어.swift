import Foundation

let n = Int(readLine()!)!
var answer = 0

for _ in 0..<n {
    let string = readLine()!
    var stack: [Character] = []
    
    for char in string {
        if stack.isEmpty {
            stack.append(char)
        } else {
            if stack.last! == char {
                stack.popLast()
            } else {
                stack.append(char)
            }
        }
    }
    
    answer += stack.isEmpty ? 1 : 0
}

print(answer)
