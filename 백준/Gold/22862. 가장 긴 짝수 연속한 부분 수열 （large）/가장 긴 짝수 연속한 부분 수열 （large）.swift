// 1초
// 1024MB

// 길이 N 수열 S -> 자연수
// 원하는 위치를 골라 K번 삭제

// K번 원소를 삭제한 수열에서 짝수로 이뤄진 연속 부분 수열 중 가장 긴 길이

// N: 1~100만 -> O(N), O(NlgN)
// K: 1~10만
// 원소 1~100만

// 짝수로 이뤄진 연속 부분 수열
// st = 0, en = 0, cnt = 0, deleted = 0
// 우선 st % 2 == 0일때까지 st, en 전진
// if (A[en] % 2 || deleted < K) && en < N { deleted++, en++ }
// 그러면 이제 A[en]이 홀수거나, 제거횟수 불만족 또는 en == N

// en == N이라면 st부터 계속 연속 부분 수열로 가능하다.
// cnt = max(cnt, en - st - deleted)
// break

// cnt = max(cnt, en - st - deleted)
// if st % 2 != 0 { deleted -= 1 }
// st++

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
var A = readLine()!.split(separator: " ").map { Int($0)! }

var st = 0
while st < N {
    if A[st] % 2 == 0 { break }
    st += 1
}

var en = st
var cnt = 0
var del = 0

while true {
    while en < N && (A[en] % 2 == 0 || del < K) {
        if A[en] % 2 != 0 { del += 1 }
        en += 1
    }
    
    // en == N일때 ->
    if en == N {
        cnt = max(cnt, en - st - del)
        break
    }
    
    // A[en] 홀수 & del == K
    cnt = max(cnt, en - st - del)
    if A[st] % 2 != 0 { del -= 1 }
    st += 1
}
print(cnt)

// Testcase
// 1 1
// 1
// --
// 0


