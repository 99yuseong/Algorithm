# 견적

# N * N 크기의 정사각형
# 0: empty
# 1: wall

# 직선도로 > 100원
# 코너 > 500원

# 다익스트라
# N: 3~25
# 총 625칸

# a -> b가 고정된 금액이 아니라
# ? -> a -> b에 따라 금액이 달라짐

# pq: (v, cost)
# pq: (v, V or H)

import heapq

def solution(board):
        
    dx = [0, 0, -1, 1]
    dy = [-1, 1, 0, 0]
    dd = [0, 0, 1, 1] # 1: 가로, 2: 세로, 0: 양방향
    
    N = len(board)
    
    INF = float('inf')
    cost = [[[INF] * 2 for _ in range(N)] for _ in range(N)]
    
    queue = [(0, 0, 0, 0), (0, 0, 0, 1)] # (cost, x, y, d)
    cost[0][0][0] = 0
    cost[0][0][1] = 0
    
    while queue:
        
        cur_c, cur_x, cur_y, cur_d = heapq.heappop(queue)
        
        if cost[cur_x][cur_y][cur_d] < cur_c:
            continue
            
        for k in range(4):
            x = cur_x + dx[k]
            y = cur_y + dy[k]
            d = dd[k]
            c = 100 if d == cur_d else (500 + 100)
            
            if 0 <= x < N and 0 <= y < N and board[x][y] == 0 and cur_c + c < cost[x][y][d]:    
                cost[x][y][d] = cur_c + c
                heapq.heappush(queue, (cost[x][y][d], x, y, d))
    
    return min(cost[N-1][N-1])