#           (x2, y2)
#
# (x1, y1)

def is_on_line(rect, x, y):
    
    on_line = False
    
    for x1, y1, x2, y2 in rect:
        if x1 < x < x2 and y1 < y < y2:
            return False
        
        if x in [x1, x2] and y1 <= y <= y2:
            on_line = True
            
        elif y in [y1, y2] and x1 <= x <= x2:
            on_line = True
            
    return on_line

from collections import deque

def solution(rectangle, characterX, characterY, itemX, itemY):
    
    rect = [[x1*2, y1*2, x2*2, y2*2] for x1, y1, x2, y2 in rectangle]
    
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    
    visited = [[False] * 51 * 2 for _ in range(51 * 2) ]
    queue = deque()
    
    queue.append((characterX*2, characterY*2, 0))
    visited[characterX*2][characterY*2] = True
    
    while queue:
        cur_x, cur_y, cur_d = queue.popleft()
        
        if cur_x == itemX*2 and cur_y == itemY*2:
            return d // 2
        
        for k in range(4):
            x = cur_x + dx[k]
            y = cur_y + dy[k]
            d = cur_d + 1
            
            if not visited[x][y] and is_on_line(rect, x, y):
                queue.append((x, y, d))
                visited[x][y] = True
    
    return -1