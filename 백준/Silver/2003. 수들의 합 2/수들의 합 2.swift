// 0.5초
// 128MB

// N개의 수로 된 수열 A
// i~j까지의 합이 M이 되는 경우의 수를 구하는 프로그램

// N: 1~1만개의 수
// M: 1~3억 사이 값
// A[x]는 3만이하의 자연수

// 수열 A의 연속된 부분합이 M이 되는 횟수 카운트
// 투 포인터로 st, en = 0, tot = A[0], cnt = 0
// tot < M까지 en++
// tot == M cnt++, st++ tot-=A[st]

// en이 N이 되면 정지 (더이상 부분합이 M과 같거나 커질 수 없다.)
// O(2N)로 해결 가능

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var A = readLine()!.split(separator: " ").map { Int($0)! }

var st = 0
var en = 0
var tot = A[0]
var cnt = 0

while true {
    // M 미만일 경우 en계속 전진
    while tot < M && en < N {
        en += 1
        if en != N { tot += A[en] }
    }
    
    // 만약 en이 N에 도달한다면 더이상 부분합 M 이상 불가능
    if en == N { break }

    // M이 되는 경우의 수 카운트
    if tot == M { cnt += 1 }
    // st 전진
    tot -= A[st]
    st += 1
}
print(cnt)

// testCase
// 1 1
// 0
// --
// 0

// 2 1
// 1 1
// --
// 2

