# 범위를 선택 > 시계방향 회전
# 회전 목록의 최소값을 저장
# return [회전1 최솟값, 회전2 최솟값 ... ]

# rows: 2~100
# cols: 2~100

# 최대 100칸 > 최대 40칸의 원소를 옮긴다.
# 회전 횟수는 1~1만개

# (40칸 원소 회전 + 40칸 원소 갱신) * 1만번 회전

def rotate(map, x1, y1, x2, y2):
    
    if x1+1 == x2 and y1+1 == y2:
        tmp = map[x1][y1]
        map[x1][y1] = map[x2][y1]
        map[x2][y1] = map[x2][y2]
        map[x2][y2] = map[x1][y2]
        map[x1][y2] = tmp
        return min(map[x1][y1], map[x2][y1], map[x2][y2], map[x1][y2])
    
    topleft = map[x1][y1]
    topright = map[x1][y2]
    bottomleft = map[x2][y1]
    bottomright = map[x2][y2]
    
    min_num = min([topleft, topright, bottomleft, bottomright])
    
    for i in range(x1, x2):
        min_num = min(min_num, map[i+1][y1])
        map[i][y1] = map[i+1][y1]
        
    for j in range(y2, y1+1, -1):
        min_num = min(min_num, map[x1][j-1])
        map[x1][j] = map[x1][j-1]
    map[x1][y1+1] = topleft
    
    for i in range(x2, x1+1, -1):
        min_num = min(min_num, map[i-1][y2])
        map[i][y2] = map[i-1][y2]
    map[x1+1][y2] = topright
    
    for j in range(y1, y2-1):
        min_num = min(min_num, map[x2][j+1])
        map[x2][j] = map[x2][j+1]
    map[x2][y2-1] = bottomright
    
    return min_num

def solution(rows, columns, queries):
    
    
    map = [[0] * columns for _ in range(rows)]
    
    num = 1
    for i in range(rows):
        for j in range(columns):
            map[i][j] = num
            num += 1
    
    answer = []
    
    for x1, y1, x2, y2 in queries:
        min_num = rotate(map, x1-1, y1-1, x2-1, y2-1)
        answer.append(min_num)
    
    return answer