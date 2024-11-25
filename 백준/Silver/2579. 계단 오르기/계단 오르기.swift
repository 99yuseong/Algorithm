import Foundation

let N = Int(readLine()!)!
var score = Array(repeating: 0, count: N+1)
for i in 1...N { score[i] = Int(readLine()!)! }

if N == 1 { print(score[1]); exit(0) }
if N == 2 { print(score[1]+score[2]); exit(0) }

var D = Array(repeating: Array(repeating: 0, count: 3), count: N+1)
D[1][1] = score[1]
D[2][1] = score[2]
D[2][2] = score[1] + score[2]

for i in 3...N {
    D[i][1] = max(D[i-2][1], D[i-2][2]) + score[i]
    D[i][2] = D[i-1][1] + score[i]
}
print(max(D[N][1], D[N][2]))
