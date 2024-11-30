// 2초
// 512MB

// N일동안 최대한 많은 상담
// N: 1~150만
// T: 1~50
// P: 1~1000 -> Int

let N = Int(readLine()!)!
var T: [Int] = [0]
var P: [Int] = [0]
var D = Array(repeating: 0, count: N+1)

for _ in 0..<N {
    let TP = readLine()!.split(separator: " ").map { Int($0)! }
    T.append(TP[0])
    P.append(TP[1])
}

// D[i]: i일 작업을 했을 때, 최대 이익
// D[i] = max(D[j] + P[i], D[i]) if j + T[j] - 1 < i

for i in 1...N {
    D[i] = max(D[i], D[i-1])
    
    if i+T[i]-1 <= N {
        D[i+T[i]-1] = max(D[i+T[i]-1], D[i-1]+P[i])
    }
}
print(D.last!)
