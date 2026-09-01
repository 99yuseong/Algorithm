# @time 20

from itertools import combinations

def check(candidate, q, ans):
    
    for i in range(len(q)):
        
        s1 = set(candidate)
        s2 = set(q[i])
        
        if len(s1 - s2) != 5 - ans[i]:
            return False
        
    return True
    

def solution(n, q, ans):
    
    answer = 0
    
    for candidate in map(list, combinations(list(range(1, n+1)), 5)):
        answer += 1 if check(candidate, q, ans) else 0
            
    return answer