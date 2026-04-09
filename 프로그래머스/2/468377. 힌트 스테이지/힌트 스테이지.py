# n개의 스테이지 1 > n 순서대로
# 힌트권 > 비용 줄어든다

# 1 > 1번 힌트권만 최대 n-1개 사용할 수 있다

# 1 ~ n-1번 스테이지에서 힌트번들 1개 구매 가능

# 힌트 번들의 종류와 가격은 다르다.
    # 힌트권 k장, 종류는 무작위다.
    # 힌트권은 항상 다음 스테이지 용들로만

# 힌트권을 활용해서 최소 비용을 써라

# cost
    # 1번 스테이지 > cost[0][0] 무조건 (힌트권 없음)
    # 2번 스테이지 > 1번 힌트권 살거임?
    
# 이게 이전에 산게 이후에 영향을 주니까

# 사냐 마냐 2가지 경우를 매 스테이지 마다 분기

# 2**(n-1) 32768가지 경우의 수

# 모든 경우의 수 dfs or dp

# dfs(사용 비용, [힌트권])

def solution(cost, hint):
    
    n = len(cost)
    min_cost = float('inf')
    
    def dfs(k, c, h): # k 번스테이지를 탐험
        
        nonlocal min_cost
        
        if k == n:
            min_cost = min(min_cost, c)
            return
        
        # 판매권 구입 안함 & 기존 판매권 사용
        dfs(k+1, c + cost[k][min(n-1, h[k])], h[:])
        
        # 판매권 구입
        if k < n-1: # 1라운드 ~ n-1라운드 구입
            for i in hint[k][1:]:
                h[i-1] += 1 # 힌트권 한장씩 추가
        
            # 사용
            dfs(k+1, c + cost[k][min(n-1, h[k])] + hint[k][0], h[:])
        
        else: 
            # 사용
            dfs(k+1, c + cost[k][min(n-1, h[k])], h[:])
        
    dfs(0, 0, [0] * (n))
    
    return min_cost