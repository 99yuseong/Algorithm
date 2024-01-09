import Foundation

let n = Int(readLine()!)!
var stack: [Int] = []


for _ in 0..<n {
    let command = readLine()!.components(separatedBy: " ")
    
    switch command[0] {
        case "pop":
            if stack.isEmpty {
                print(-1)
                break
            }
            print(stack.popLast()!)
        case "size":
            print(stack.count)
        case "empty":
            print(stack.count == 0 ? 1 : 0)
        case "top":
            if let last = stack.last {
                print(last)
            } else {
                print(-1)
            }
        default:
            stack.append(Int(command[1])!)
    }
}
