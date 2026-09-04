# @time -1

from itertools import combinations

def cal_sum(list_dice):
    
    sums = []
    
    def dfs(k, s, sums):
        
        if k == len(list_dice):
            sums.append(s)
            return
        
        for i in range(6):
            dfs(k+1, s+list_dice[k][i], sums)
    
    dfs(0, 0, sums)
            
    return sums

def lower_bound(target, sums):
    
    st = 0
    en = len(sums)
    
    while st < en:
        mid = (st + en) // 2
        
        if sums[mid] < target:
            st = mid + 1
        else:
            en = mid
            
    return st

def solution(dice):
    
    n = len(dice)
    max_win_dices = []
    max_win_cnt = 0
    
    for dice_nos in map(list, combinations(range(n), n // 2)):
        
        set_a = set(dice_nos)
        set_b = set(range(n)) - set_a
        
        list_a = list(map(lambda x: dice[x], set_a))
        list_b = list(map(lambda x: dice[x], set_b))
            
        sum_a = sorted(cal_sum(list_a))
        sum_b = sorted(cal_sum(list_b))
        
        win_cnt = 0
        
        for s in sum_a:
            win_cnt += lower_bound(s, sum_b)
            
        if win_cnt > max_win_cnt:
            max_win_cnt = win_cnt
            max_win_dices = [i + 1 for i in dice_nos]
        
    return max_win_dices