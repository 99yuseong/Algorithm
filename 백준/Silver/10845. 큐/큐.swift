import Foundation

let n = Int(readLine()!)!
var inbox: [Int] = []
var outbox: [Int] = []

for _ in 0..<n {
    let cmd = readLine()!.split(separator: " ")
    
    switch cmd[0] {
        case "pop":
            if outbox.isEmpty && inbox.isEmpty {
                print(-1)
                break
            }
        
            if outbox.isEmpty {
                outbox = inbox.reversed()
                inbox.removeAll()
            }
            print(outbox.popLast()!)
        case "size":
            print(inbox.count + outbox.count)
        case "empty":
            if inbox.isEmpty && outbox.isEmpty {
                print(1)
            } else {
                print(0)
            }
        case "front":
            if outbox.isEmpty {
                print(inbox.first ?? -1)
            } else {
                print(outbox.last!)
            }
        case "back":
            if inbox.isEmpty {
                print(outbox.first ?? -1)
            } else {
                print(inbox.last!)
            }
        default: // push X
            inbox.append(Int(cmd[1])!)
    }
}
