# 49시작 - 55종료 = 6분
# 무인도 구명보트 구출
# 최대 2명씩 + 무게 제한

# 구명보트를 최대한 적게 사용 > 모든 사람 구출
# 무게 제한, 사람
# 몇개의 보트가 필요한가

# n: 1~5만
# 40~240kg
# 항상 1명이상 구조 가능

# 정렬하고
# 앞에서부터 큰거 + 가능한 작은거 모두 > loop로 그리디하게
# 슬라이딩 윈도우 & deque > deque로 가자

from collections import deque

def solution(people, limit):
    
    # 5만명 deque
    queue = deque(sorted(people, reverse=True))
    
    cnt = 0
    
    while len(queue) > 0:
        cur = queue.popleft()
        if queue and cur + queue[-1] <= limit:
            cur += queue.pop()
        cnt += 1
        
    return cnt