# @time 25
# @tags 구현

def can_unlock(N, M, key, map, x, y):
    
    for i in range(M):
        for j in range(M):
            map[x+i][y+j] += key[i][j]
    
    unlock = True
    
    for i in range(N):
        for j in range(N):
            if map[i+M-1][j+M-1] != 1:
                unlock = False
                break
            
    for i in range(M):
        for j in range(M):
            map[x+i][y+j] -= key[i][j]
    
    return unlock
        
def rotate(key):
    
    M = len(key)
    
    rotated = [[0] * M for _ in range(M)]
    
    for i in range(M):
        for j in range(M):
            rotated[j][M-i-1] = key[i][j]
    
    return rotated    

def solution(key, lock):
    
    M = len(key)
    N = len(lock)
    
    map = [[0] * (N+(M-1)*2) for _ in range(N+(M-1)*2)]
    
    for x in range(N):
        for y in range(N):
            map[x+M-1][y+M-1] = lock[x][y]
            
    
    for i in range(N+M-1):
        for j in range(N+M-1): 
            
            k = 0
            while k < 4:
                if can_unlock(N, M, key, map, i, j):
                    return True
                key = rotate(key)
                k += 1
    
    return False