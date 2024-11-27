// 시간 제한 2초, 메모리 128MB

// 크기가 5인 정수 삼각형 -> 맨 아래 숫자가 5개다
// 선택된 수의 합의 크기가 최대가 되는 경로 (왼, 오 선택)

// 삼각형의 크기는 1이상 500이하
// 선택은 총 0번 ~ 499번

// 최대 케이스는 2^499 BOOM!
import Foundation

let N = Int(readLine()!)!
var D = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)

for i in 1...N {
    D[i] = [0] + readLine()!.split(separator: " ").map { Int($0)! }
}

if N == 1 { print(D[1][1]); exit(0) }

D[2][1] = D[1][1] + D[2][1]
D[2][2] = D[1][1] + D[2][2]
if N == 2 { print(max(D[2][1], D[2][2])); exit(0) }

for i in 3...N {
    for j in 1...i {
        D[i][j] = max(D[i-1][max(0,j-1)], D[i-1][min(j, i-1)]) + D[i][j]
    }
}

print(D[N].max()!)

