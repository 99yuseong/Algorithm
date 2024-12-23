// 1초
// 256MB

// N! / ( (N-K)! * K! )
// NCK = N-1CK-1 + N-1CK
// D[n][k] = D[n-1][k-1] + D[n-1][k]

// D[1][0] = 1
// D[1][1] = 1
// D[2][0] = 1

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
var D = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)

for i in 0...N {
    D[i][0] = 1
}
 
for n in 1...N {
    for k in 1...n {
        D[n][k] = (D[n-1][k-1] + D[n-1][k]) % 10007
    }
}
print(D[N][K])
