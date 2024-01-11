import Foundation

out: while true {
    let input = readLine()!
    if input == "." { break }
    
    var stack: [Character] = []
    
    for char in input {
        if char == "(" || char == "[" {
            stack.append(char)
        } else if char == ")" || char == "]" {
            if stack.isEmpty {
                print("no")
                continue out
            } else if stack.last! == "(" && char == ")" || stack.last! == "[" && char == "]" {
                stack.popLast()
            } else {
                print("no")
                continue out
            }
        }
    }
    
    if stack.isEmpty {
        print("yes")
    } else {
        print("no")
    }
}
