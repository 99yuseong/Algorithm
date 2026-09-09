# @time 10
# @tags DP

# N행 4열
# 같은 열을 연속해서 밟을 수 없는 규칙 # 점수의 최댓값

# D[i][j]: i행에서 i열을 밟았을때 최댓값
# D[i][j] = max(D[i-1][j1], D[i-1][j2], D[i-1][j3]) + land[i][j] if j not in [j1, j2, j3]
# D[0][j] = land[0][j]

def solution(land):
    
    N = len(land)
    
    D = [[0] * 4 for _ in range(N)] 
    
    D[0] = land[0]
    
    for i in range(1, N):
        
        for j in range(4):
            max_sum = 0
            
            for k in range(4):
                if j == k:
                    continue
                max_sum = max(max_sum, D[i-1][k])
            
            D[i][j] = max_sum + land[i][j]

    return max(D[N-1])