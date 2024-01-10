import Foundation

let N = Int(readLine()!)!

for _ in 0..<N {
    let cmds = readLine()!
    let n = Int(readLine()!)!
    let arr = readLine()!.trimmingCharacters(in: ["[", "]"]).split(separator: ",")
    
    var head: Int = 0
    var tail: Int = n - 1
    var isReversed = false
    var isError = false
    
    for cmd in cmds {
        if cmd == "R" {
            isReversed.toggle()
        } else {
            if head > tail {
                isError = true
                break
            }
            if isReversed {
                tail -= 1
            } else {
                head += 1
            }
        }
    }
    
    if isError {
        print("error")
    } else if head > tail {
        print("[]")
    } else {
        if isReversed {
            print("[" + Array(arr[head...tail].reversed()).map { String($0) }.joined(separator: ",") + "]")
        } else {
            print("[" + Array(arr[head...tail]).map { String($0) }.joined(separator: ",") + "]")
        }
    }
}
