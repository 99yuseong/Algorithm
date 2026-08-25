# 9분~

# 길 o, 장애물 x
# 직사각형

# 최종 위치

# park: 50 * 50  2500칸

# routes: 50

# cur을 잡고
# 9 * 50 = 450번 움직여야함

def move(d):
    if d == "E": 
        return [0, 1]
    elif d == "W": 
        return [0, -1]
    elif d == "N": 
        return [-1, 0]
    else: 
        return [1, 0]

def solution(park, routes):
    
    cur = [0,0]
    
    for x in range(len(park)):
        for y in range(len(park[0])):
            if park[x][y] == "S":
                cur = [x, y]
                break
    
    for route in routes:
        
        tmp = cur
        
        (d, s) = route.split()    
        mv = move(d)
        s = int(s)
        
        while s:
            
            nx = tmp[0] + mv[0]
            ny = tmp[1] + mv[1]
            
            if nx < 0 or nx >= len(park) or ny < 0 or ny >= len(park[0]):
                break
            
            if park[nx][ny] == "X":
                break
            
            s -= 1
            tmp = [nx, ny]
        
        if s > 0:
            continue
            
        cur = tmp
    
    return cur