// 2초
// 128MB

// 집 N개가 나열
// 와이파이 공유기 C개를 설치
// 한 집에 1개만 가능
// 가장 인접한 공유기 사이의 거리 최대 -> 최대한 균등하게 분배

// N: 2~20만개의 집
// C: 2~20만개의 공유기
// 집의 좌표 -> 0~10억

// 1 2 4 8 9
// 공유기의 최소 거리는 1 ~ 최대 처음과 마지막 집 사이의 거리
import Foundation

let NC = readLine()!.split(separator: " ").map { Int($0)! }
let N = NC[0]
let C = NC[1]
var A: [Int] = []
for _ in 0..<N {
    A.append(Int(readLine()!)!)
}
A.sort()

func countIptime(d: Int) -> Int {
    var cur = A.first!
    var count = 1
    
    for i in 1..<N {
        if cur + d <= A[i] {
            count += 1
            cur = A[i]
        }
    }
    
    return count
}

var st = 1
var en = A.last! - A.first!
var answer = 0

while st <= en {
    let mid = (st + en) / 2
    
    let count = countIptime(d: mid)

    if count < C { // 거리를 줄여야해
        en = mid - 1
    } else { // 거리를 늘려야해
        st = mid + 1
        answer = max(mid, answer)
    }
}
print(answer)
