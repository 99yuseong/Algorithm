# @time -1
# @tags DFS

from collections import defaultdict

def solution(tickets):
    
    n = len(tickets)
    
    tickets.sort(key=lambda x: (x[0], x[1]))
    
    graph = defaultdict(list)
    
    for start, end in tickets:
        graph[start].append(end)
        
    for start in graph:
        graph[start].sort(reverse=True)
    
    route = []
    
    def dfs(airport):
        while graph[airport]:
            next_airport = graph[airport].pop()
            dfs(next_airport)
        route.append(airport)
    
    dfs("ICN")
    
    return route[::-1]
