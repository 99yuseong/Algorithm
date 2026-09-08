# @time 30
# @tags DP

# 거쳐간 숫자의 합이 가장 큰 경우

# DP[i][j] : i번째에서 j인덱스를 선택했을 떄 최댓값
# DP[i][j] = max(DP[i-1][j-1], DP[i-1][j]) + triangle[i][j]
# DP[0][0] = triangle[0][0]


def solution(triangle):
    
    n = len(triangle)
    
    DP = [[0] * (n+1) for _ in range(n+1)]
    
    DP[0][0] = triangle[0][0]
    
    for i in range(1, n):
        for j in range(i+1):
            DP[i][j] = max(DP[i-1][j-1], DP[i-1][j]) + triangle[i][j]
        
    return max(DP[n-1])