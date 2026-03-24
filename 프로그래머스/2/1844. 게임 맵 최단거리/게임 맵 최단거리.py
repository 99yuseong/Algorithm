# ROR 게임
# 상대방 진영 파괴시 승리 > 최대한 빨리 도착해야한다.

# 도착 가능할 수도, 못할 수도 있다.
# 지나가야하는 칸의 최솟값 > 없으면 -1

# BFS로 거리 카운트
# 가중치가 1인 최단 경로 > BFS

# 맵의 크기는 최대 1만
# 벽: 0, 칸: 1

# 1,1 > n,m으로

from collections import deque

def solution(maps):
    
    n = len(maps)
    m = len(maps[0])
    
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    
    visited = [[-1] * m for _ in range(n)]
    queue = deque()
    
    queue.append([0,0])
    visited[0][0] = 1
    
    while len(queue) > 0:
        cur = queue.popleft()
        
        for k in range(4):
            x = cur[0] + dx[k]
            y = cur[1] + dy[k]
            
            if 0 <= x < n and 0 <= y < m and maps[x][y] == 1 and visited[x][y] == -1:
                visited[x][y] = visited[cur[0]][cur[1]] + 1
                queue.append([x, y])
    
    return visited[n-1][m-1]