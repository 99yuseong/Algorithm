# @time -1
# @tags DP

# 1만칸
# 최단 경로의 개수를 MOD로 나눈 나머지
# 물웅덩이 존재

def solution(m, n, puddles):
    
    MOD = 1_000_000_007
    
    DP = [[0] * (m+1) for _ in range(n+1)]
    
    for x, y in puddles:
        DP[y][x] = -1
    
    DP[1][1] = 1
    
    for i in range(1, n+1):
        for j in range(1, m+1):
            
            if i == 1 and j == 1:
                continue
            
            if DP[i][j] == -1:
                continue
                
            if DP[i-1][j] != -1:
                DP[i][j] += DP[i-1][j]
                
            if DP[i][j-1] != -1:
                DP[i][j] += DP[i][j-1]
            
            DP[i][j] %= MOD
        
    return DP[n][m]