# bool 배열

def solution(a, d, included):
    
    answer = a if included[0] else 0
    cur = a
    
    for i in range(1, len(included)):
        cur += d
        answer += cur if included[i] else 0
        
    return answer