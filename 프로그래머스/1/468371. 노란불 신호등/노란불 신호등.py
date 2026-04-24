# 신호등 n개
# 초록 > 노랑 > 빨강

# 정전 > 모두 노랑이면 정전

# 주기 5초
# 주기 7초

# 5로 나눠서 나머지가 3일때 t = 5x + 3
# 7로 나눠서 나머지가 6일때 t = 7y + 6

# 모든 신호등이 노란불이 되는 가장 빠른 시각. 없다면 -1

# 총 5개의 애들

# 모든 signals의 최대 공약수

# 최대 주기 : 3~20 사이

# 총 100 넘어가면 끝

def solution(signals):
    
    n = len(signals)
    periods = []
    yellows = []
    
    for g, y, r in signals:
        yellow = []
        for i in range(y):
            yellow.append(g+i)
        periods.append(g+y+r)
        yellows.append(yellow)
    
    
    for t in range(1, 20**5): # 5개의 주기가 모두 서로소인 경우 > 약 O(320000)
        i = 0
        while i < n:
            if t % periods[i] not in yellows[i]: break
            i += 1
        
        if i == n: # 모두 노란불
            return t+1
        
    return -1