# 비밀의 문
# 열쇠 + 자물쇠로 푼다.

# 자물쇠 > N*N정사각 격자
# 열쇠 > M*M 정사각 격자

# 회전, 이동
# 좌물쇠 영역이 딱 맞아야한다.



# key: M * M  :20 * 20 > 400칸
# lock: N * N  : 20 * 20 > 400칸

# M <= N

# key > 1부분이 중요
# lock = 0 부분이 중요

# 4번 회전 (N + M) * (N + M) > 1600번을 비교
    # 6400 * 400개 세면서 1인지 확인

    
# [M-1][N][M-1] > 19 + 20 + 19 > 58

# 약 3600칸을 확인
    # 4
        # 400 + 
    
# 열 수 있으면 True    


# 1. Lock의 key 생성
# 2. 0 ~ ()


def is_unlock(map, key, x, y):
    
    M = len(key)
    N = len(map) - (M-1) * 2
    
    cnt = N*N
    
    for i in range(x, x+M):
        for j in range(y, y+M):
            map[i][j] += key[i-x][j-y]
    
    for i in range(M-1, M-1+N):
        for j in range(M-1, M-1+N):            
            if map[i][j] == 1:
                cnt -= 1
    
    for i in range(x, x+M):
        for j in range(y, y+M):
            map[i][j] -= key[i-x][j-y]
    
    return cnt == 0

def rotate(key):
    
    M = len(key)
    new_key = [[0] * M for _ in range(M)]
    
    for i in range(M):
        for j in range(M):
            new_key[i][j] = key[j][M-1-i]
    
    return new_key

def create_map(lock, N, M):
    
    map = []
    
    for i in range(M-1):
        map.append([0] * (M-1 + N + M-1))
        
    for i in range(N):
        map.append([0] * (M-1) + lock[i] + [0] * (M-1))
        
    for i in range(M-1):
        map.append([0] * (M-1 + N + M-1))
    
    return map

def solution(key, lock):

    N = len(lock)
    M = len(key)
    
    map = create_map(lock, N, M)
    
    print(is_unlock(map, [[0,0,0], [0,0,1], [0,1,0]], 2, 2))
    
    for i in range(len(map)-M+1):
        for j in range(len(map)-M+1):
            
            for _ in range(4):
                if is_unlock(map, key, i, j):
                    return True
                key = rotate(key)

    return False