let A = ["-"] + Array(readLine()!)
let B = ["-"] + Array(readLine()!)

let n = A.count - 1
let m = B.count - 1

// DP 테이블 초기화
var D = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

// DP 테이블 채우기
for i in 1...n {
    for j in 1...m {
        if A[i] == B[j] {
            D[i][j] = D[i-1][j-1] + 1
        } else {
            D[i][j] = max(D[i-1][j], D[i][j-1])
        }
    }
}

// LCS 길이 출력
print(D[n][m])

// 역추적
var i = n
var j = m
var lcs = [Character]() // LCS 문자열을 담을 배열

while i > 0 && j > 0 {
    if A[i] == B[j] {
        lcs.append(A[i]) // 공통 문자를 추가
        i -= 1
        j -= 1
    } else if D[i-1][j] > D[i][j-1] {
        i -= 1 // 위쪽으로 이동
    } else {
        j -= 1 // 왼쪽으로 이동
    }
}

// 역추적 결과는 거꾸로 저장되므로 뒤집어서 출력
print(String(lcs.reversed()))
