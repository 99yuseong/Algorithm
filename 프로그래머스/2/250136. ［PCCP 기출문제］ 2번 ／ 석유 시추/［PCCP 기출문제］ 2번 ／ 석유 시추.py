from collections import deque

def solution(land):
    
    # 1. BFS 석유 땅 저장
    
    n = len(land)
    m = len(land[0])
    
    oils = [0]
    land_no = 0
    cur_land_oil = 0
    queue = deque()
    
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    
    for i in range(n):
        for j in range(m):
            
            if land[i][j] == 1:
                land_no -= 1
                
                land[i][j] = land_no
                queue.append((i, j))
                cur_land_oil = 1
                
                while queue:
                    cur = queue.popleft()
                    
                    for k in range(4):
                        x = cur[0] + dx[k]
                        y = cur[1] + dy[k]
                        
                        if 0 <= x < n and 0 <= y < m and land[x][y] == 1:
                            queue.append((x, y))
                            land[x][y] = land_no
                            cur_land_oil += 1
                
                oils.append(cur_land_oil)
                
    # 2. 시추 확인
    
    max_total_oil = 0
    
    for j in range(m):
        
        total_oil = 0
        visited = [False] * (1 - land_no)
        
        for i in range(n):
            if land[i][j] < 0 and not visited[-land[i][j]]:
                total_oil += oils[-land[i][j]]
                visited[-land[i][j]] = True
        
        max_total_oil = max(max_total_oil, total_oil)
        
    return max_total_oil