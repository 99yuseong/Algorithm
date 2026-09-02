# @time -1


def cal_jump_dist(stones, crossed):
    
    max_jump_dist = 0
    jump_dist = 0
    
    for i in range(len(stones)):
        if stones[i] <= crossed:
            jump_dist += 1
        else:
            max_jump_dist = max(max_jump_dist, jump_dist)
            jump_dist = 0
    
    return max(max_jump_dist, jump_dist)     

def solution(stones, k):
    
    st = 1 
    en = max(stones)
    
    while st < en:
        mid = (st + en) // 2
        
        if cal_jump_dist(stones, mid) < k:
            st = mid + 1
        else:
            en = mid
    
    return st