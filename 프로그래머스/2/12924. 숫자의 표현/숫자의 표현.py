def solution(n):
    answer = 1
    
    for i in range(1, n):
        n -= i
        if n / (i+1) > 0 and n % (i+1) == 0:
            answer += 1
    
    return answer