# @time 15

def cal_time(times, diffs, level):
    t = 0
    for i in range(len(times)):
        if diffs[i] <= level:
            t += times[i]
        else: # diffs[0] = 1이므로 prev 없을땐 else를 타지 않는다
            t += (diffs[i] - level) * (times[i] + times[i-1]) + times[i]
    return t   
    
def solution(diffs, times, limit):
    
    st = 1
    en = 10 ** 15
    
    while st < en:
        mid = (st + en) // 2
        
        if cal_time(times, diffs, mid) > limit:
            st = mid + 1
        else:
            en = mid
    
    return st