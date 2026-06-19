# dp[k]: k거리를 뛸 수 있는 방법
# dp[k] = dp[k-1] + dp[k-2]
# dp[1] = 1
# dp[2] = 2

def solution(n):
    
    if n == 1: return 1
    if n == 2: return 2
    
    mod = 1234567
    dp = [0] * (n+1)
    
    dp[1] = 1
    dp[2] = 2
    
    for i in range(3, n+1):
        dp[i] = (dp[i-1] + dp[i-2]) % mod
    
    return dp[n]