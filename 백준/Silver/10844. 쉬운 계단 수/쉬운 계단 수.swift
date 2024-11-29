// 길이가 N인 계단 수... 9*10^99
// N: 1~100
// D[i][j]: 길이가 i인 j로 끝나는 계단 수의 개수
// D[i][0]: D[i-1][1]
// D[i][j]: D[i-1][k] (1<=j<=8, k=j-1 or k=j+1)
// D[i][9]: D[i-1][8]

// D[1][0] = 0
// D[1][j] = 1 (1<=j<=8) // 8개
// D[1][9] = 1

// D[2][0] = D[1][1] = 1
// D[2][j] = D[1][k] = 2 (2<=j<=8, k=j-1 or k=j+1) // 8개
// D[2][9] = D[1][8] = 1
import Foundation

let N = Int(readLine()!)!
var D = Array(repeating: Array(repeating: 0, count: 10), count: N+1)

D[1][0] = 0
for j in 1...9 {
    D[1][j] = 1
}

if N == 1 {
    print(D[1].reduce(0, +))
    exit(0)
}

for i in 2...N {
    D[i][0] = D[i-1][1] % 1000000000
    for j in 1...8 {
        D[i][j] = (D[i-1][j-1] + D[i-1][j+1]) % 1000000000
    }
    D[i][9] = D[i-1][8] % 1000000000
}

print(D[N].reduce(0, +) % 1000000000)
