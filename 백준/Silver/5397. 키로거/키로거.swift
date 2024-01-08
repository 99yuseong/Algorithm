import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
    let commands = Array(readLine()!)
    
    var left: [Character] = []
    var right: [Character] = []
    
    for command in commands {
        switch command {
            case "<":
                if !left.isEmpty {
                    right.append(left.removeLast())
                }
            case ">":
                if !right.isEmpty {
                    left.append(right.removeLast())
                }
            case "-":
                if !left.isEmpty {
                    left.removeLast()
                }
            default:
                left.append(command)
        }
    }
    
    print(String(left + right.reversed()))
}
