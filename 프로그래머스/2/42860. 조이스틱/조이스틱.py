# 조이스틱 알파벳 이름
# 맨 처음만 A

# 위 - 다음
# 아 - 이전
# 왼 - 커서
# 오 - 커서 

# AAAA 로 구성된 이름
# 굴려서 일치하는 이름으로 만들어라

# 움직이는 최솟값

# 다 연결되어 있음 > 최소 좌우 이동, 최소 상하 이동의 합은 몇인가

# 좌우 이동 > 
# 상하 이동 > 아스키 코드 차이 x: min(26 - x, x)

def solution(name):
    
    n = len(name)
    cur = ['A'] * n
    s = 0
    e = 0
    
    for i in range(n):
        if cur[i] != name[i]:
            s = i
            break
            
    for i in range(n-1, -1, -1):
        if cur[i] != name[i]:
            e = i
            break
    
    h_mv = min(e, n-s)
    
    target = []
    for i in range(n):
        if name[i] != 'A':
            target.append(i)
    
    for i in range(len(target)-1):
        s = target[i]
        e = target[i+1]
        
        if s < n-e:
            h_mv = min(h_mv, s + s + n-e)        
        else:
            h_mv = min(h_mv, n-e + n-e + s)     
        
    v_mv = 0
    for i in range(n):
        if cur[i] != name[i]:
            v_mv += mv_updown(cur[i], name[i])
    
    return h_mv + v_mv

def mv_updown(a, b):
    x = abs(ord(a) - ord(b))
    return min(26-x, x)

# 오른쪽으로 가는 경우 