import Foundation
// "(", ")", "[", "]"

out: while true {
    let sentense = readLine()!
    if sentense.first! == "." { exit(0) } // 종료 조건
    
    var stack: [Character] = []
    
    for word in sentense {
        switch word {
        case "(":
            stack.append("(")
        case ")":
            if !stack.isEmpty && stack.last! == "(" {
                _ = stack.popLast()
            } else {
                stack.append(")")
            }
        case "[":
            stack.append("[")
        case "]":
            if !stack.isEmpty && stack.last! == "[" {
                _ = stack.popLast()
            } else {
                stack.append("]")
            }
        default:
            break
        }
    }
    
    print(stack.isEmpty ? "yes" : "no")
}
