// 1초
// 192MB

// N개의 꽃
// 같은 해에 피어서 같은 해에 진다.

// 3월 1일 ~ 11월 30일 한 가지 이상의 꽃
// 가능한 적은 꽃

// 선택한 꽃의 최소 개수
import Foundation

let N = Int(readLine()!)! // N 꽃의 개수 1~10만
var F: [[Int]] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    F.append([input[0] * 100 + input[1], input[2] * 100 + input[3]])
}

F.sort { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] }

var cnt = 0
var t = 301

while t < 1201 {
    var nextT = t
    
    for i in 0..<N {
        if F[i][0]..<F[i][1] ~= t {
            nextT = F[i][1]
        }
    }
    
    if nextT == t {
        print(0)
        exit(0)
    }
    
    cnt += 1
    t = nextT
}
print(cnt)