import Foundation

let N = Int(readLine()!)!
for _ in 0..<N {
    let input = readLine()!
    var left: [String] = []
    var right: [String] = []
    
    for key in input {
        switch key {
        case "-": if !left.isEmpty { left.removeLast() }
        case "<": if !left.isEmpty { right.append(left.removeLast()) }
        case ">": if !right.isEmpty { left.append(right.removeLast()) }
        default: left.append(String(key))
        }
    }
    
    print((left + right.reversed()).joined())
}