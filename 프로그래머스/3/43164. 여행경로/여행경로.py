# 주어진 항공권 다 사용해서 여행경로
# ICN에서 시작

# 항공권 > 티켓은 중복 가능?
# 공항은 최대 1만개
# a > b가 있다.
# 모두 사용해라.
# 경로가 2개 이상일 경우엔 알파벳 순 정렬
# 가능한 케이스만 주어진다.

# K개의 티켓을 모두 소모
# N개의 공항에 모두 방문
# DFS로 K번의 여행 > 최종에 공항 CNT
# 인덱스 X > key 기반 graph { 'from': ('to', cnt) }
# 공항은 set으로 n 카운트

def solution(tickets):
    
    n = len(tickets)
    answer = []
    finished = False
    
    tickets.sort(key= lambda x: x[1])
    used = [False] * n
    
    def dfs(route):
        nonlocal answer, finished, used
        if finished:
            return
        
        if len(route) == n+1:
            answer = route
            finished = True
            return
        
        last = route[-1]
        for i in range(n):
            if used[i] is False and tickets[i][0] == last:
                used[i] = True
                dfs(route + [tickets[i][1]])
                used[i] = False 
                
    dfs(["ICN"])
    return answer