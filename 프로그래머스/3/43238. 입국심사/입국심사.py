# @time 7

def passed(times, t):
    passed = 0
    for time in times:
        passed += t // time
    return passed

def solution(n, times):
    
    st = 1
    en = 1000000000 * 1000000000
    
    while st < en:
        mid = (st + en) // 2
        
        if passed(times, mid) < n:
            # 시간 부족
            st = mid + 1
        else:
            # 가능함
            en = mid
    
    return st