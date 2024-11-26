//  / 3
//  / 2
//  -1

// 연산힛수
// 10^6

// D[N] -> 연산 후 1이 되는 횟수의 최솟값
// D[N] = D[N/3] + 1 , N 3배수
// D[N] = D[N/2] + 1, N 2배수
// D[N] = D[N-1] + 1
import Foundation

let N = Int(readLine()!)!
var D = Array(repeating: 0, count: N+1)
var A = Array(repeating: Array(repeating: 0, count: 0), count: N+1)

if N == 1 {
    print(0)
    print(1)
    exit(0)
}
if N == 2 {
    print(1)
    print("2 1")
    exit(0)
}
if N == 3 {
    print(1)
    print("3 1")
    exit(0)
}

D[1] = 0
A[1] = [1]
D[2] = 1
A[2] = [1,2]
D[3] = 1
A[3] = [1,3]

for i in 4...N {
    D[i] = D[i-1] + 1
    A[i] = A[i-1] + [i]
    if i % 3 == 0 && min(D[i], D[i/3] + 1) == D[i/3] + 1 {
        D[i] = D[i/3] + 1
        A[i] = A[i/3] + [i]
    }
    if i % 2 == 0 && min(D[i], D[i/2] + 1) == D[i/2] + 1 {
        D[i] = D[i/2] + 1
        A[i] = A[i/2] + [i]
    }
}

print(D[N])
print(A[N].reversed().map { String($0)}.joined(separator: " "))
