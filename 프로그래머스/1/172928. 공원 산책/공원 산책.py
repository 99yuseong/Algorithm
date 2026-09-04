# @time 15
# @tags 구현

def direction(d):
    if d == "E":
        return [0, 1]
    elif d == "W":
        return [0, -1]
    elif d == "S":
        return [1, 0]
    else:
        return [-1, 0]

def solution(park, routes):
    
    n = len(park)
    m = len(park[0])
    
    # 1. 시작 위치 좌표 찾기
    
    for i in range(n):
        for j in range(m):
            if park[i][j] == "S":
                dog = [i, j]
                break
    
    # 2. 명령 수행
    
    for route in routes:
        d, step = map(str, route.split())
        
        d = direction(d)
        step = int(step)
        
        tmp = dog.copy()
        
        while step > 0:
            
            tmp[0] += d[0]
            tmp[1] += d[1]
            
            if tmp[0] < 0 or tmp[0] >= n or tmp[1] < 0 or tmp[1] >= m:
                break
            
            if park[tmp[0]][tmp[1]] == "X":
                break
            
            step -= 1
        
        if step == 0:
            dog = tmp
    
    return dog