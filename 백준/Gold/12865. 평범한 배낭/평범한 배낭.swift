let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0] // N 물품의 수, 1~100개
let K = NK[1] // K 최대 무게, 1~10만

// 물품당 무게 1~10만, 가치 0~1000
var WV: [[Int]] = [[0,0]]
for _ in 0..<N {
    WV.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// D[i][j]: 최대 무게가 i일때, j번째까지 물건을 고려한 최대 가치
// D[i][j] = D[i-1][j] // 무거워서 못담았을 때
// D[i][j] = D[i-WV[j][0]][j-1] + WV[j][1]


var D = Array(repeating: Array(repeating: 0, count: N+1), count: K+1)

for i in 1...K {
    for j in 1...N {
        if i >= WV[j][0] { // 넣을 수 있을 때
            D[i][j] = max(D[i-WV[j][0]][j-1] + WV[j][1], D[i][j-1])
        } else {
            D[i][j] = D[i][j-1]
        }
    }
}

print(D[K][N])
