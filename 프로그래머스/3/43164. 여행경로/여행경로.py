# 항공권을 모두 사용한 여행 경로
# ICN에서 출발
# route를 담아라

# E가 1만개 주어진다 > E를 다써라?

# 무조건 앞선 경로를 가야한다가 아님
# 갈 수 있는 route를 다 만들고, 알파벳순 정렬된거 기준으로 가장 빠른 것

# graph 만들고 k개의 루트 생성

def solution(tickets):
    
    n = len(tickets)
    
    airports = set()
    graph = {}
    for ticket in tickets:
        graph.setdefault(ticket[0], []).append(ticket[1])
        airports.add(ticket[0])
        airports.add(ticket[1])
    
    routes = []
    cur = ["ICN"]
    used = set()
    
    def dfs(k):
        nonlocal cur, routes
        
        if k == n:
            if len(airports) == len(set(cur)):
                routes.append(cur[:])
            return
        
        for v in graph.get(cur[-1], []):
            t = (cur[-1], v)
            if (cur[-1], v) not in used:
                used.add(t)
                cur.append(v)
                dfs(k+1)
                cur.pop()
                used.discard(t)
            
    dfs(0)
    
    routes.sort()
    
    return routes[0]