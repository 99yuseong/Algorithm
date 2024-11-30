// 0.1초

// 최장 공통부분수열
// 최대 천글자

// D[i][j]: A의 i번째, B의 j번째까지의 최대 LCS의 길이
// D[i][j] = D[i-1][j-1] + 1 if A[i] == B[j]
// D[i][j] = max(D[i][j-1], D[i-1][j]) if A[i] != B[j]

let A = ["-"] + Array(readLine()!)
let B = ["-"] + Array(readLine()!)
var D = Array(repeating: Array(repeating: 0, count: B.count), count: A.count)

for i in 1...A.count-1 {
    for j in 1...B.count-1 {
        if A[i] == B[j] {
            D[i][j] = D[i-1][j-1] + 1
        } else {
            D[i][j] = max(D[i-1][j], D[i][j-1])
        }
    }
}
print(D[A.count-1][B.count-1])
