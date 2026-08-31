# @time 13 

from collections import deque

def bfs(maps):
    
    n = len(maps)
    m = len(maps[0])
    
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    
    queue = deque()
    visited = [[-1 for _ in range(m)] for _ in range(n)]
    
    queue.append([0,0])
    visited[0][0] = 1
    
    while queue:
        cur = queue.popleft()
        
        for i in range(4):
            x = cur[0] + dx[i]
            y = cur[1] + dy[i]
            
            if (
                x >= 0 and x < n
                and y >= 0 and y < m 
                and visited[x][y] == -1 
                and maps[x][y] == 1
            ):
                visited[x][y] = visited[cur[0]][cur[1]] + 1
                queue.append([x, y])
                
    return visited[n-1][m-1]

def solution(maps):
    return bfs(maps)