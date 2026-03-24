# 네트워크, 정보교환 형태
# 컴퓨터 n대, 네트워크는 몇개? > BFS
# 200대 컴퓨터, 연결은 adjMatrix로 준다.

from collections import deque

def solution(n, computers):

    graph = {}
    
    for i in range(n):
        for j in range(n):
            if i == j:
                continue
                
            if computers[i][j] == 1:
                graph.setdefault(i, []).append(j)
    
    
    
    network = 0
    visited = [False] * n
    queue = deque()
    
    for i in range(n):
        if visited[i] is False:
            network += 1
            queue.append(i)
            visited[i] = True

            while len(queue) > 0:
                cur = queue.popleft()

                for v in graph.get(cur, []):
                    if visited[v] is False:
                        queue.append(v)
                        visited[v] = True
                    
    return network