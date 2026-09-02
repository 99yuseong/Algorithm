# 35 ~ @time -1

def canCross(stones, k, x):
    continuous = 0
    
    for stone in stones:
        if stone - x <= 0:
            continuous += 1
        else:
            continuous = 0
        
        if continuous >= k:
            return False
        
    return True

def solution(stones, k):
    
    st = 1
    en = max(stones)
    
    while st < en:
        mid = (st + en) // 2
        
        if canCross(stones, k, mid):
            st = mid + 1
        else:
            en = mid
    
    return st