import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let n = input[1]
let indexs = readLine()!.split(separator: " ").map { Int($0)! }

var arr: [Int] = Array(1...N)
var answer = 0

for i in 0..<n {
    let targetIdx = arr.firstIndex(of: indexs[i])!
    
    if targetIdx > arr.count - targetIdx {
        answer += arr.count - targetIdx
        for _ in 0..<arr.count - targetIdx {
            arr.insert(arr.popLast()!, at: 0)
        }
    } else {
        answer += targetIdx
        for _ in 0..<targetIdx {
            arr.append(arr.removeFirst())
        }
    }
    arr.removeFirst()
}

print(answer)
