// 2초
// 128MB

// 2개의 나무
// 매 초마다 한 쪽에서 열매가 떨어진다.

// T: 1~1000초
// W: 1~30번만 움직이고 싶다.

// 자두는 1번 위치
// 최대 자두의 개수는?

import Foundation

let TW = readLine()!.split(separator: " ").map { Int($0)! }
let T = TW[0]
let W = TW[1]

var D = Array(repeating: Array(repeating: Array(repeating: 0, count: W+1), count: T+1), count: 3)
var A: [Int] = [0]
for _ in 0..<T { A.append(Int(readLine()!)!) }

// D[1][i][j]: 1위치에 있을 때, i초 경과, j번 움직였을 때의 최대 자두
// D[2][i][j]: 2위치에 있을 때, i초 경과, j번 움직였을 때의 최대 자두

// A[i] == 1
// D[1][i][j] = max(D[2][i-1][j-1], D[1][i-1][j]) + 1
// D[2][i][j] = max(D[2][i-1][j], D[1][i-1][j-1])

// A[i] == 2
// D[1][i][j] = max(D[2][i-1][j-1], D[1][i-1][j])
// D[2][i][j] = max(D[2][i-1][j], D[1][i-1][j-1]) + 1

if T == 1 {
    print(1)
    exit(0)
}

if A[1] == 1 {
    D[1][1][0] = 1
} else {
    D[2][1][1] = 1
}

for i in 2...T {
    for j in 0...W {
        if A[i] == 1 {
            
            if j == 0 {
                D[1][i][0] = D[1][i-1][0] + 1
                continue
            }
            
            D[1][i][j] = max(D[1][i-1][j], D[2][i-1][j-1]) + 1
            D[2][i][j] = max(D[1][i-1][j-1], D[2][i-1][j])
        } else {
            
            if j == 0 {
                D[1][i][0] = D[1][i-1][0]
                continue
            }
            
            D[1][i][j] = max(D[1][i-1][j], D[2][i-1][j-1])
            D[2][i][j] = max(D[1][i-1][j-1], D[2][i-1][j]) + 1
        }
    }
}

print(max(D[1][T].max()!, D[2][T].max()!))
