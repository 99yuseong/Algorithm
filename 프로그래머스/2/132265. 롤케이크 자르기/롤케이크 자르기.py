# @time 13
# @tags 해시

from collections import defaultdict
    
def solution(topping):
    
    answer = 0
    
    d_a = defaultdict(int)
    d_b = defaultdict(int)
    
    for t in topping:
        d_b[t] += 1
    
    for t in topping:
        d_a[t] += 1
        
        if d_b[t] > 1:
            d_b[t] -= 1
        else:
            d_b.pop(t)
        
        if len(d_a.keys()) == len(d_b.keys()):
            answer += 1
    
    return answer