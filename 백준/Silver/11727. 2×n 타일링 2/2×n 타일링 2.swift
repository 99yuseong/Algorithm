// 1*2, 2*1, 2*2 타일로 채우는 방법의 수
// N 1 <= N <= 1000
import Foundation

let N = Int(readLine()!)!
var D = Array(repeating: 0, count: N+1)

if N == 1 {
    print(1)
    exit(0)
}

if N == 2 {
    print(3)
    exit(0)
}

D[1] = 1
D[2] = 3
for i in 3...N {
    D[i] = (D[i-1] + D[i-2] * 2) % 10007
}
print(D[N])
