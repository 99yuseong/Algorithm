import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let string = readLine()!
    var stack: [Character] = []
    var result = ""
    
    for char in string {
        if stack.isEmpty {
            stack.append(char)
        } else {
            if char == "(" {
                stack.append(char)
            } else if char == ")" && stack.last! == "("{
                stack.popLast()
            } else {
                result = "NO"
                break
            }
        }
    }
    
    if stack.isEmpty {
        result = "YES"
    } else {
        result = "NO"
    }
    
    print(result)
}
