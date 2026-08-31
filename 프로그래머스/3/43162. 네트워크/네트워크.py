# @time 11

from collections import defaultdict, deque

def solution(n, computers):
    
    graph = defaultdict(list)
    
    for i in range(n):
        for j in range(n):
            if computers[i][j] and i != j:
                graph[i].append(j)
    
    queue = deque()
    network = [-1 for _ in range(n)]
    cnt = 0
    
    for i in range(n):
        if network[i] == -1:
            cnt += 1
            queue.append(i)
            network[i] = cnt
            
            while queue:
                cur = queue.popleft()
                
                for next in graph[cur]:
                    if network[next] == -1:
                        queue.append(next)
                        network[next] = cnt
    
    return cnt