// 피보나치 수열 D[N]을 호출했을 때, 0과 1이 몇번 출력되는 지

// D[N]: D번째 수열에서 [a, b] 0과 1이 호출된 횟수
// D[N] = [D[N-1][0] + D[N-2][0], D[N-1][1] + D[N-2][1]]
// D[3] = [D[2][0] + D[1][0], D[2][1] + D[1][1]]
// D[2] = [1,1]
// D[1] = [0,1]
// D[0] = [1,0]

let T = Int(readLine()!)!
for _ in 0..<T {
    let N = Int(readLine()!)! // 0 <= N <= 40
    
    if N == 0 { print("1 0"); continue }
    if N == 1 { print("0 1"); continue }
    
    var D = Array(repeating: Array(repeating: 0, count: 2), count: N+1)
    D[0] = [1,0]
    D[1] = [0,1]
    for i in 2...N {
        D[i] = [D[i-1][0] + D[i-2][0], D[i-1][1] + D[i-2][1]]
    }
    
    print("\(D[N][0]) \(D[N][1])")
}
