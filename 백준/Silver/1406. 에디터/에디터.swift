import Foundation

let str = readLine()!
let M = Int(readLine()!)!
var left = Array(str)
var right = Array<Character>()

for _ in 0..<M {
    let cmd = readLine()!
    
    switch cmd {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D":
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B":
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(cmd.last!)
    }
}

print(String(left + right.reversed()))
