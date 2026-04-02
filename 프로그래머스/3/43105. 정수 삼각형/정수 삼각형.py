# 꼭대기 > 바닥
# 거쳐간 숫자의 합이 가장 큰 경우


# [a, b, c, d, e] > 0 > 
# 왼쪽: 2*i + 1, 오른쪽: 2*i + 2

# 매번 좌,우를 선택
# 모든 경우의 수를 관리 > 500회의 선택
# 2^500 > 시간초과

# DP로 저장
# DP[i][k]: i번째 층에서 k번째 길을 선택했을때 최댓값
# DP[i][k] = max(DP[i-1][k-1], DP[i-1][k]) + A[i-1][k-1]
# DP[1][1] = A[0][0]
# 1 + ... + 500 = 약 1만 2500

def solution(triangle):
    
    n = len(triangle)
    k = len(triangle[-1])
    
    DP = [[0] * (k+1) for _ in range(n+1)]
    DP[1][1] = triangle[1-1][1-1]
    
    for i in range(2, n+1): # 2층부터 n층
        for j in range(1, i+1): # 1번부터 i번까지 길
            DP[i][j] = max(DP[i-1][j-1], DP[i-1][j]) + triangle[i-1][j-1]
    
    return max(DP[-1])