// 1초
// 512 MB

// N명의 토너먼트
// 1번 ~ N번
// 인접한 번호끼리
// 홀수 -> 마지막 자동 진출
// 다음 라운드에선 숫자 리셋
// 순서 유지하면서 숫자 리셋
// 1명이 남을때까지

// 몇 라운드에 대결하는가?

// 참가자수, 김지민 번호, 임한수 번호
// N: 2~10만
// 김지민, 임한수
// 대결하지 않을때는 -1

// 현재 번호가 짝수 -> n/2
// 현재 번호가 홀수 -> n+1/2
// 홀수 - 짝수 연속된 수로 만나는가?

// N이 10만 이하 -> 최대 라운드 17 라운드

// 코드 전략 (시도 1)

// 1. while 문으로 2로 N을 계속 나눈다. round += 1
// 2. 짝수 / 2 || 홀수 + 1 / 2
// 3. 홀수 - 짝수 연속된 수로 만나는 지 체크
// 만약 N이 1이되면 Stop
// 그때까지 안되면 -1

//import Foundation
//
//let NAB = readLine()!.split(separator: " ").map { Int($0)! }
//var N = NAB[0]
//var A = NAB[1]
//var B = NAB[2]
//var R = 1
//
//while N != 0 {
//    if abs(A-B) == 1 && ((A < B && A % 2 == 1) || (B < A && A % 2 == 0)) {
//        print(R)
//        exit(0)
//    }
//    
//    N /= 2
//    R += 1
//    A = A % 2 == 0 ? A / 2 : (A+1) / 2
//    B = B % 2 == 0 ? B / 2 : (B+1) / 2
//}
//print(-1)


// 코드 전략 (시도 2)

// 1. Round = 0 시작
// 2. A = (A+1) / 2, B = (B+1) / 2
    // 만약 A와 B가 대결을 한다면, A == B이다.

// 3. 해당 토너먼트의 입력값은 고정
    // 반드시 대결을 하게된다.
    // 즉, -1을 출력할 수 없다.

let NAB = readLine()!.split(separator: " ").map { Int($0)! }
var N = NAB[0]
var A = NAB[1]
var B = NAB[2]
var R = 0

while A != B {
    R += 1
    A = (A + 1) / 2
    B = (B + 1) / 2
}
print(R)

// TestCase
// Input: 100000 1 100000, Output: 17
// Input: 2 1 2, Output: 1
