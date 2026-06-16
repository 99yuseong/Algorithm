def solution(n):
    mod = 1234567
    
    fibo = [0] * 100001
    fibo[1] = 1
    
    for i in range(2, 100001):
        fibo[i] = (fibo[i-1] + fibo[i-2]) % mod
    
    return fibo[n]