// 5초?

// 매일 3가지 중 한 행동
// 1. 주식을 산다
// 2. 원하는 만큼 주식 팔기
// 3. 아무것도 안한다.

// 최대이익 계산하기

let T = Int(readLine()!)!
for _ in 0..<T {
    let N = Int(readLine()!)! // 2 ~ 100만
    let A = [0] + readLine()!.split(separator: " ").map { Int($0)! }
    var D = Array(repeating: 0, count: N+1)

    // D[i]: i일 이후 Max 값
    // D[i] = max(A[i], D[i+1]) where i < N
    // D[N] = A[N]
    
    var ans = 0
    
    D[N] = A[N]
    for i in (1...N-1).reversed() {
        D[i] = max(A[i], D[i+1])
    }
    
    for i in 1...N {
        // 최대 값에서 판 가격이 양수라면 더해주기!
        ans += D[i] - A[i] > 0 ? D[i] - A[i] : 0
    }
    
    print(ans)
}