// 1초
// 256MB

// 모든 조카에게 같은 길이의 과자 & 최대한 긴 과자

// M명의 조카에게 N개의 과자를 나눠줄때 최대 길이
// 길이는 양수,
// M: 1~100만명
// N: 1~100만개

// 나눠줄 수 없다면 0을 출력
// 과자의 길이는 1~10억

// 과자 길이...
// N의 합 / M명의 최댓값... -> OverFlow

// 1~10억 사이의 길이 중 1개 선택
// N개의 과자를 해당 길이로 자르면 M개 이상이 되는 가?
// 이분탐색 실패 -> 0

// O(NlgN)

let MN = readLine()!.split(separator: " ").map { Int($0)! }
let M = MN[0]
let N = MN[1]
var A = readLine()!.split(separator: " ").map { Int($0)! }

var minX = 0
var maxX = 1000000000 // 10억

while minX < maxX {
    let mid = (minX + maxX + 1) / 2
    
    if cut(mid) < M { // 길이가 너무 길어
        maxX = mid - 1
    } else { // x 길이까지 가능해
        minX = mid
    }
}
print(minX)

// x 길이로 과자를 잘랐을 때의 개수
func cut(_ x: Int) -> Int {
    var count = 0
    for a in A { // O(N)
        count += a / x
    }
    return count
}

// TestCase
//
