# 폭우 > 물에 잠기지 않은 지역 > 학교
# M*N 격자
# 물에 잠긴지역 [x,y]

# 이동시> 오른쪽과 아래로만 움직여 갈 수 있는 최단 경로
# dx = [1, 0]
# dy = [0, 1]

# 최단 경로의 개수의 MOD
# 크기 1만
# 물에 잠긴건 10개 이하
# 최대 200칸을 2^200으로 이동

# BFS 아니라 > 총 개수 카운트하는 문제
# 시간초과난다.

# 직접 카운트하면 안됨
# DP[i][j]: (i,j)칸에 도달할 수 있는 경우의 수
# DP[i][j] = DP[i-1][j] + DP[i][j-1] > if (i-1,j)과 (i, j-1)이 각각 물웅덩이가 아닌 경우에만
# DP[1][1] = 1

def solution(m, n, puddles):
    MOD = 1000000007
    
    DP = [[0] * (m+1) for _ in range(n+1)]
    DP[1][1] = 1
    
    for y, x in puddles:
        DP[x][y] = -1
        
    for x in range(1, n+1):
        for y in range(1, m+1):
            
            # 가려는 곳은 웅덩이가 아닌가?
            if DP[x][y] >= 0:
                
                # 좌측이 웅덩이가 아닐때
                if DP[x-1][y] >= 0:
                    DP[x][y] += DP[x-1][y]
                
                # 위쪽이 웅덩이가 아닐때
                if DP[x][y-1] >= 0:
                    DP[x][y] += DP[x][y-1]
                    
                DP[x][y] = DP[x][y] % MOD
    
    return DP[n][m]