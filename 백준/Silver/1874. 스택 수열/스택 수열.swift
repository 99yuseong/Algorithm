import Foundation

let n = Int(readLine()!)!

var target: [Int] = []

var data: [Int] = Array(1...n).reversed()
var stack: [Int] = []
var command: [Character] = []

for _ in 0..<n {
    let num = Int(readLine()!)!
    target.append(num)
}

out: for num in target {
    while true {
        if stack.isEmpty {
            stack.append(data.removeLast())
            command.append("+")
            continue
        }
        
        let top = stack.last!
        
        if top < num {
            if data.isEmpty {
                break out
            }
            stack.append(data.removeLast())
            command.append("+")
            continue
        }
        
        if top == num {
            stack.removeLast()
            command.append("-")
            break
        }
        
        if top > num {
            break out
        }
    }
}

if data.isEmpty && stack.isEmpty {
    for com in command {
        print(com)
    }
} else {
    print("NO")
}
