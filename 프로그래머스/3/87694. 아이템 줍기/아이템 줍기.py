from collections import deque

def solution(rectangle, characterX, characterY, itemX, itemY):
    board = [[0] * 102 for _ in range(102)]

    # 좌표 2배 확대
    rects = []
    for x1, y1, x2, y2 in rectangle:
        rects.append([x1 * 2, y1 * 2, x2 * 2, y2 * 2])

    # 사각형 영역 칠하기
    for x1, y1, x2, y2 in rects:
        for x in range(x1, x2 + 1):
            for y in range(y1, y2 + 1):
                if x1 < x < x2 and y1 < y < y2:
                    board[x][y] = 2      # 내부
                elif board[x][y] != 2:
                    board[x][y] = 1      # 테두리

    sx, sy = characterX * 2, characterY * 2
    ex, ey = itemX * 2, itemY * 2

    q = deque([(sx, sy, 0)])
    visited = [[False] * 102 for _ in range(102)]
    visited[sx][sy] = True

    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]

    while q:
        x, y, dist = q.popleft()

        if x == ex and y == ey:
            return dist // 2

        for k in range(4):
            nx = x + dx[k]
            ny = y + dy[k]

            if 0 <= nx < 102 and 0 <= ny < 102:
                if not visited[nx][ny] and board[nx][ny] == 1:
                    visited[nx][ny] = True
                    q.append((nx, ny, dist + 1))