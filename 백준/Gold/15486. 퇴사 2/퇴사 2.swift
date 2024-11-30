// 2초
// 512MB

// N일동안 최대한 많은 상담
// N: 1~150만
// T: 1~50
// P: 1~1000 -> Int

let N = Int(readLine()!)!
var D = Array(repeating: 0, count: N+1)

// D[i]: i일 작업을 했을 때, 최대 이익
// D[i] = max(D[j] + P[i], D[i]) if j + T[j] - 1 < i

for i in 1...N {
    let TP = readLine()!.split(separator: " ").map { Int($0)! }
    let T = TP[0]
    let P = TP[1]
    
    D[i] = max(D[i], D[i-1])
    
    if i+T-1 <= N {
        D[i+T-1] = max(D[i+T-1], D[i-1]+P)
    }
}

print(D.last!)
