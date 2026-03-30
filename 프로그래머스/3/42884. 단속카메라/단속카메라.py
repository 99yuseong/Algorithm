# 정렬 > 끝나는 시간이 빠른 순

# 빨리 끝나는 것 종료 시 > 범위 안에 있는 빠르게 시작한 애들 제거

def solution(routes):
    
    n = len(routes)
    arr_finish = sorted(routes, key=lambda x: x[1])
    arr_start = sorted(routes, key=lambda x: -x[0])
    
    finish = set()
    cnt = 0
    
    for i in range(n):
        s, e = arr_finish[i]
        
        if (s, e) in finish: 
            continue
        
        finish.add((s, e))
        
        while arr_start and arr_start[-1][0] <= e and arr_start[-1][1] >= s:
            route = arr_start.pop()
            finish.add((route[0], route[1]))
        cnt += 1
    
    return cnt