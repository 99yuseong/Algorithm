// 시간제한 0.1초
// 두 수열이 주어질 때, 부분 수열 중 가장 긴 수열 찾기
// 1. LCS의 길이
// 2. LCS

// D[i][j]: i번째, j번째 원소까지의 LCS [String]
// D[i][j]: D[i-1][j-1] + String(A[i]) if A[i] == B[j]
// D[i][j]: D[i-1][j].count > D[i][j-1] ? D[i-1][j] : D[i][j-1] if A[i] != B[j]

//let A = ["-"] + Array(readLine()!)
//let B = ["-"] + Array(readLine()!)
//let N = A.count - 1
//let M = B.count - 1
//var D = Array(repeating: Array(repeating: "", count: M+1), count: N+1)
//
//for i in 1...N {
//    for j in 1...M {
//        if A[i] == B[j] {
//            D[i][j] = D[i-1][j-1] + String(A[i])
//        } else {
//            D[i][j] = D[i-1][j].count > D[i][j-1].count ? D[i-1][j] : D[i][j-1]
//        }
//    }
//}
//
//print(D[N][M].count)
//print(D[N][M])

// 1차 시간 초과
// 현재 제한 시간은 0.1초 -> 약 5천만 이내로 연산을 해야한다.
// 최악의 경우 A와 B의 문자열의 길이는 1000
// 이중 For 문이기 때문에 1000 * 1000 -> 100만 회
// 만약 LCS의 길이가 1000이라면, 10억회의 연산 -> 시간 초과
// 루프 안으로 넣는 것이 아니라 외부로 빼야한다!

let A = ["-"] + Array(readLine()!)
let B = ["-"] + Array(readLine()!)
let N = A.count - 1
let M = B.count - 1
var D = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)

// O(N*M) => 최악 1000 * 1000 : 약 천만
for i in 1...N {
    for j in 1...M {
        if A[i] == B[j] {
            D[i][j] = D[i-1][j-1] + 1
        } else {
            D[i][j] = max(D[i-1][j], D[i][j-1])
        }
    }
}

print(D[N][M]) // 최대 횟수

var n = N
var m = M
var lcs: [Character] = []

// O(N + M) => 최악 약 2000
while n > 0 && m > 0 {
    if A[n] == B[m] {
        lcs.append(A[n])
        n -= 1
        m -= 1
    } else {
        if D[n-1][m] > D[n][m-1] {
            n -= 1
        } else {
            m -= 1
        }
    }
}

print(String(lcs.reversed()))