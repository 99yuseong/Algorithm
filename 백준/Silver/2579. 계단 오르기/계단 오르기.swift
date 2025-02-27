// 한 계단 / 두 계단 씩
// 연속된 3개의 계단 밟기 안됨
// 마지막 도착은 밟아야 한다.

// N: 계단 개수, 1~300, 점수: 1~1만
func solution(_ N: Int, _ S: [Int]) -> Int {
    // D[i]: i번째 계단을 밟았을 때까지의 최대 점수
    // 2, 1로 온 경우
    // 2로 온 경우
    // D[i] = D[i-3] + S[i-1] + S[i]
    // D[i] = D[i-2] + S[i]
    
    // D[1] = S[1]
    // D[2] = S[1] + S[2]
    
    let S = [0] + S
    if N == 1 { return S[1] }
    if N == 2 { return S[1] + S[2] }
    
    var D = Array(repeating: 0, count: N+1)
    D[1] = S[1]
    D[2] = S[1] + S[2]
    
    for i in 3...N {
        D[i] = max(D[i-3] + S[i-1] + S[i],
                   D[i-2] + S[i])
    }
    
    return D[N]
}

let N = Int(readLine()!)!
var S: [Int] = []
for _ in 0..<N {
    S.append(Int(readLine()!)!)
}
print(solution(N, S))
