// 11:21 시작

// 돌게임
// 돌 N개
// 1, 3, 4개를 가져갈 수 있다.
// 상근 시작

// 1~1천
// 1, 3, 4로 N을 분리했을때 -> 마지막 숫자는?

// 111 -> 3
// 1111 -> 4
// 3^k = N
// k가 짝수 -> SK
// k가 홀수 -> CY

// 경우의 수 다 세는건 시간초과
// DP[i]: i번째 돌을 가져갈때 턴이 홀수 턴인지
// DP[i] = !DP[i-1] or !DP[i-3] or !DP[i-4]

// DP[1] = true
// DP[2] = false
// DP[3] = true
// DP[4] = true
// DP[5] = false or true or false = true
// DP[6] = false or false or true = true

func solution(_ N: Int) -> String {
    
    if N == 1 { return "SK" }
    if N == 2 { return "CY" }
    if N == 3 { return "SK" }
    if N == 4 { return "SK" }
    
    var dp = [Bool](repeating: false, count: N+1)
    
    dp[1] = true
    dp[2] = false
    dp[3] = true
    dp[4] = true
    
    for i in 5...N {
        dp[i] = !dp[i-1] || !dp[i-3] || !dp[i-4]
    }
    
    return dp[N] ? "SK" : "CY"
}

let N = Int(readLine()!)!
print(solution(N))