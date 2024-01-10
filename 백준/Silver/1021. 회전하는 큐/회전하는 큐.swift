import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let n = input[1]
let indexs = readLine()!.split(separator: " ").map { Int($0)! }

var arr: [Int] = Array(1...N)
var answer = 0
var index = 0

for i in 0..<n {
    let targetIdx = arr.firstIndex(of: indexs[i])!
    
    if abs(targetIdx - index) * 2 > arr.count {
        answer += arr.count - abs(targetIdx - index)
    } else {
        answer += abs(targetIdx - index)
    }
    
    index = targetIdx % arr.count
    arr.remove(at: targetIdx)
}

print(answer)
