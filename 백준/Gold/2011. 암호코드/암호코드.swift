func solution(_ secret: String) -> Int {
    let MOD = 1_000_000
    let A = Array(secret).map { Int(String($0))! }
    let n = A.count
    if A[0] == 0 { return 0 }

    func canOneDigit(_ i: Int) -> Bool {
        return A[i] != 0
    }

    func canTwoDigit(_ i: Int) -> Bool {
        if i == 0 { return false }
        let num = A[i-1] * 10 + A[i]
        return 10...26 ~= num
    }

    var dp = [Int](repeating: 0, count: n)
    dp[0] = 1

    for i in 1..<n {
        if canOneDigit(i) { dp[i] += dp[i-1] }
        if canTwoDigit(i) { dp[i] += dp[i-2 >= 0 ? i-2 : 0] }
        dp[i] %= MOD
    }

    return dp[n-1]
}

let secret = readLine()!
print(solution(secret))