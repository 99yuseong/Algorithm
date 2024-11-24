import Foundation

let N = Int(readLine()!)! // 1 <= N <= 100000
var arr: [Int] = []

var cur: Int = 0
var cnt: Int = 0
var max: Int = -Int(pow(2.0, 62.0)) - 1
var maxCnt: Int = 0

for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}
arr.sort()

cur = arr[0]

for i in 0..<N {
    if arr[i] == cur {
        cnt += 1
    } else {
        if cnt > maxCnt {
            max = cur
            maxCnt = cnt
        }
        cur = arr[i]
        cnt = 1
    }
}

if cnt > maxCnt {
    max = cur
}

print(max)
