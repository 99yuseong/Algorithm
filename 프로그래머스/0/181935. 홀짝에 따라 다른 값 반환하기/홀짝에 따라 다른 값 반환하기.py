def solution(n):
    if n % 2 == 1:
        # 홀수 합을 리턴
        return sum(i for i in range(1, n+1, 2))
        
    else:
        # 짝수 제곱의 합을 리턴
        return sum(i*i for i in range(2, n+1, 2))