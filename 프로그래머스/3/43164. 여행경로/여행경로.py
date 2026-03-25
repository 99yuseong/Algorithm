# 모든 티켓을 다써서 여행 경로, 불가능한 경우는 주어지지 않는다. = 타캣을 다 쓰면 다 도착한다는 개념
# ICN에서 출발해서 티켓을 다쓰는 경로 중 알파벳 순서가 앞서는 경우가 무엇인가.

# 최대 경로는 10000개 티켓

# 그리디로 정렬하고
# dfs로 가장 먼저 도착하는 경우를 return

def solution(tickets):
    
    # 도착 경로를 알파벳 순으로 정렬
    tickets.sort(key=lambda x: x[1])
    
    n = len(tickets)
    used = [False] * n
    
    def dfs(route):
        nonlocal used
        
        if len(route) == n+1:
            return route
        
        for i in range(n):
            if used[i] is False and tickets[i][0] == route[-1]:
                used[i] = True
                rt = dfs(route + [tickets[i][1]])
                used[i] = False
                
                if rt:
                    return rt
    
    return dfs(["ICN"])