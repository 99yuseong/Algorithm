import Foundation

// 모든 글자가 ABfh
// A - A. A - B
// 1억개의 입력 -> 0(N)

let N = Int(readLine()!)!
var num = 0

for _ in 0..<N {
    var stack: [Character] = []
    let sentence = readLine()!
    for char in sentence {
        if !stack.isEmpty && char == stack.last! {
            _ = stack.popLast()
        } else {
            stack.append(char)
        }
    }
    num += stack.isEmpty ? 1 : 0
}
print(num)