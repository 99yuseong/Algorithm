def solution(k, tangerine):
    
    sizes = {}
    
    for t in tangerine:
        if t not in sizes:
            sizes[t] = 0
        sizes[t] += 1
    
    kv = list(sizes.items())
    kv.sort(key=lambda x: x[1])
    
    answer = 0
    while k > 0:
        _, val = kv.pop()
        answer += 1
        k -= val
    
    return answer