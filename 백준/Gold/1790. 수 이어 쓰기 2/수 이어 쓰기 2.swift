// 시간 2초
// 메모리 64MB

// 숫자 이어쓰기? 문자열?
// k번째 자리 숫자

// N: 1~1억, K: 1~10억
// 1부터 N까지 수를 이어쓰기
// 9자리 * 1억 = 9억 길이 배열 -> 36GB 밴...
// 무조건 문자열로

// i: 1~8
// 9 * 10^(i-1) * i 개수 체크
import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

var k = K
var i = 1
var cnt = 9 * Int(pow(10.0, Double(i-1))) * i

while k > cnt {
    k -= cnt
    i += 1
    cnt = 9 * Int(pow(10.0, Double(i-1))) * i
}

var num = Int(pow(10.0, Double(i-1))) + (k-1) / i

if num <= N {
    print(Array(String(num))[(k-1) % i])
} else {
    print(-1)
}

// TestCase
// Input: 20 23 Output: 6
// Input: 1 1 Output: 1
// Input: 10 11 Output: 0
// Input: 10 10 Output: 1
// Input: 999 2889 Output: 9

