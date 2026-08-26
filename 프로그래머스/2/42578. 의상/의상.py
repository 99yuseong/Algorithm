def solution(clothes):
    
    d = {}
    
    for cloth in clothes:
        d[cloth[1]] = d.get(cloth[1], 0) + 1
        
    answer = 1
    for k, v in d.items():
        answer *= v + 1
        
    return answer - 1