// 삼각형 피보나치
// N: 1~100
let T = Int(readLine()!)!


for _ in 0..<T {
    let N = Int(readLine()!)!
    var D = Array(repeating: 0, count: N+5)
    
    D[1] = 1
    D[2] = 1
    D[3] = 1
    D[4] = 2
    D[5] = 2
    
    if N < 6 {
        print(D[N])
        continue
    }
    
    for i in 6...N {
        D[i] = D[i-1] + D[i-5]
    }
    print(D[N])
}