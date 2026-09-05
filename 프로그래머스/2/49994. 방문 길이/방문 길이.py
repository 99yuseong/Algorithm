# @time 20
# @tags 구현

def delta(dir):
    if dir == "U":
        return (-1, 0, 0)
    elif dir == "D":
        return (1, 0, 3)
    elif dir == "R":
        return (0, 1, 2)
    else: # L
        return (0, -1, 1)

def solution(dirs):
    
    k = 5
    map = [[[-1] * 4 for _ in range(k*2+1)] for _ in range(k*2+1)]
    
    pos = [k, k]
    first_move = 0
    
    for dir in dirs:
        
        dx, dy, d = delta(dir)
        
        px1, py1 = pos[0], pos[1]
        px2, py2 = px1 + dx, py1 + dy
        d1, d2 = d, 3-d
        
        if px2 < 0 or px2 >= k*2+1 or py2 < 0 or py2 >= k*2+1:
            continue
        
        if map[px1][py1][d1] == -1 and map[px2][py2][d2] == -1:
            first_move += 1
            map[px1][py1][d1] = 0
            map[px2][py2][d2] = 0
        
        pos[0] += dx
        pos[1] += dy
            
    return first_move