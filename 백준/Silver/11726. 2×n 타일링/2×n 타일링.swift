// 2*n 크기의 직사각형
// 1*2 / 2*1의 타일로 채우는 방법의 수

// D[N] = D[N-2] + D[N-1]
// D[1] = 1
// D[2] = 2

// 1 <= N <= 1000
// 방법의 수를 10007로 나눈 나머지
import Foundation

let N = Int(readLine()!)!
if N < 3 { print(N); exit(0) }
var D = Array(repeating: 0, count: N+1)

D[1] = 1
D[2] = 2

for i in 3...N {
    D[i] = (D[i-2] + D[i-1]) % 10007
}

print(D[N])
