import Foundation

// 오른쪽에 있으면서 Ai보다 큰 수 중에서 가장 왼쪽에 있는 수
// == 오른쪽으로 가다가 만난 자기보다 큰 가장 첫 번째 수
// >> Stack
// 없을땐 -1

let A = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var stack: [Int] = []
var result = Array(repeating: -1, count: arr.count)

for i in 0..<A {
    while !stack.isEmpty && arr[i] > arr[stack.last!] {
        result[stack.last!] = arr[i]
        _ = stack.popLast()
    }
    stack.append(i)
}

print(result.map { String($0) }.joined(separator: " "))