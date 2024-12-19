// 1초
// 128 MB

// 0 1
import Foundation

let N = Int(readLine()!)!
var D = Array(repeating: 0, count: N+1)
D[0] = 0
D[1] = 1

if N < 2 {
    print(D[N])
    exit(0)
}

for i in 2...N {
    D[i] = D[i-1] + D[i-2]
}
print(D[N])