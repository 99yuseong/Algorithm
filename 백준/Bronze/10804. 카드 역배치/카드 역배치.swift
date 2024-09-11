import Foundation

let N = 10
var arr = Array(1...20)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let loopCnt = (input[1] - input[0] + 1) / 2
    
    for i in 0..<loopCnt {
        let startIdx = (input[0] - 1) + i
        let endIdx = (input[1] - 1) - i
        let tmp = arr[startIdx]
        arr[startIdx] = arr[endIdx]
        arr[endIdx] = tmp
    }
}

print(arr.map { String($0) }.joined(separator: " "))
