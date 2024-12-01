// 2초
// 128MB

// N은 N보다 작은 제곱 수의 합으로 표현 가능
// 항의 최소 개수는 3이다.

// N: 1~10만 -> O(N) / O(NLogN)
// D[i] = i의 제곱 수 항의 최소 개수
// D[i] = D[sqrt*sqrt] + D[N-sqrt*sqrt]
// 7 = 2^2 + 1^2 + 1^2 + 1^2
// 1 = 1^2
// 4 = 2^2
// 11 = 3^2 + 1^2 + 1^2
// 13 = 3^2 + 2^2
import Foundation

let N = Int(readLine()!)!
var D = Array(repeating: 0, count: N+1)

D[1] = 1

for i in 1...N {
    let num = Int(sqrt(Double(i)))

    if num * num == i {
        D[i] = 1
    } else {
        D[i] = i
        for j in 1...num {
            D[i] = min(D[i], D[j*j] + D[i-j*j])
        }
    }
}
print(D[N])

