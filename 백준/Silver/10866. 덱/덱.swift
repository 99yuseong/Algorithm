
import Foundation

let n = Int(readLine()!)!

var lstack: [Int] = []
var rstack: [Int] = []

for _ in 0..<n {
    let cmd = readLine()!.split(separator: " ")

    switch cmd[0] {
        case "push_front":
            lstack.append(Int(cmd[1])!)
        case "push_back":
            rstack.append(Int(cmd[1])!)
        case "pop_front":
            if lstack.isEmpty && rstack.isEmpty {
                print(-1)
                break
            }
        
            if lstack.isEmpty {
                lstack = rstack.reversed()
                rstack.removeAll()
            }
            print(lstack.popLast()!)
        case "pop_back":
            if lstack.isEmpty && rstack.isEmpty {
                print(-1)
                break
            }
        
            if rstack.isEmpty {
                rstack = lstack.reversed()
                lstack.removeAll()
            }
            print(rstack.popLast()!)
        case "size":
            print(lstack.count + rstack.count)
        case "empty":
            if lstack.isEmpty && rstack.isEmpty {
                print(1)
            } else {
                print(0)
            }
        case "front":
            if lstack.isEmpty {
                print(rstack.first ?? -1)
            } else {
                print(lstack.last!)
            }
        case "back":
            if rstack.isEmpty {
                print(lstack.first ?? -1)
            } else {
                print(rstack.last!)
            }
        default:
            break
    }
}
