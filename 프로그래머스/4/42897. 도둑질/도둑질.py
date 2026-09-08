# @time -1
# @tags DP

# 인접한 두 집을 털면 경보

# 훔칠 수 있는 최댓값.
# 3~100만개의 집
# 최대 돈은 10억

# DP[i][0]: i번째 집을 훔쳤을 때 돈의 최댓값
# DP[i][1]: i번쨰 집을 훔치지 않았을때 돈의 최댓값

# DP[i][0] = DP[i-1][1] + M[i]
# DP[i][1] = max(DP[i-1][0], DP[i-1][1])

# 처음 집을 털었나 / 처음 집을 안 털었나.

def solution(money):
    
    n = len(money)
    
    DP1 = [[0] * 2 for _ in range(n)]
    
    DP1[0][0] = money[0]
    DP1[0][1] = 0
    
    for i in range(1, n-1):
        DP1[i][0] = DP1[i-1][1] + money[i]
        DP1[i][1] = max(DP1[i-1][0], DP1[i-1][1])
    
    # 처음에 훔친 경우 최대 
    c1 = max(DP1[n-2][0], DP1[n-2][1])
    
    
    DP2 = [[0] * 2 for _ in range(n)]
    
    DP2[0][0] = 0
    DP2[0][1] = 0
    
    for i in range(1, n):
        DP2[i][0] = DP2[i-1][1] + money[i]
        DP2[i][1] = max(DP2[i-1][0], DP2[i-1][1])
    
    # 처음에 안 훔친경우 최대
    c2 = max(DP2[n-1][0], DP2[n-1][1])
    
    return max(c1, c2)