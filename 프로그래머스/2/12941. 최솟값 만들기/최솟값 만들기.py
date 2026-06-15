def solution(A,B):
    answer = 0
    
    A.sort()
    B.sort(key=lambda x: -x)
    
    for i in range(len(A)):
        answer += A[i] * B[i]
    
    return answer