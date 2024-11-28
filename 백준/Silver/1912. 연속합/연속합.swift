// 시간 1초
// 메모리 128MB

// N개의 정수로 된 수열
// 연속된 1개 이상의 수를 선택했을때 합이 가장 큰 것

// N  개수  1~100000(십만)
// 수는 -1000 ~ 1000 -1억 ~ 1억

// D[N]: N까지의 부분합 중 최대값 N 포함 / N 제외
// D[1] = arr[1]
// D[2] = max(D[N-1] + A[N], A[N])

import Foundation

let N = Int(readLine()!)!
var A = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var D = Array(repeating: -1001, count: N+1)

if N == 1 { print(A[1]); exit(0) }
D[1] = A[1]

for i in 2...N {
    D[i] = max(D[i-1] + A[i], A[i])
}
print(D.max()!)

