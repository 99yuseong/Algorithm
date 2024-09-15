import Foundation

let N = Int(readLine()!)!
var stack: [Int] = []

for _ in 0..<N {
    let cmd = readLine()!.split(separator: " ")
    
    switch cmd.first! {
    case "push":
        stack.append(Int(cmd.last!)!)
    case "pop":
        print(stack.popLast() ?? -1)
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    default: // top
        print(stack.last ?? -1)
    }
}
