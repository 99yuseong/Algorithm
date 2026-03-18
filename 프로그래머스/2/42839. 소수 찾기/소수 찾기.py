# 한자리 숫자 종이조각
# 소수를 몇개?

# 1~7개의 문자
# 0~9사이의 숫자를 연결 > 소수인가?

# 1~n개 순열 구하기
# 소수여부 판별

def solution(numbers):
    
    n = len(numbers)
    
    prime_set = set()
    for i in range(1,n+1):
        for num in permu(numbers, i):
            if isPrime(num):
                prime_set.add(num)
    
    return len(prime_set)

def permu(numbers, n):
    
    result = set()
    cur = ""
    isUsed = [False] * len(numbers)
    
    def select(k):
        nonlocal cur
        
        if k == n:
            result.add(int(cur))
            return
        
        for i in range(len(numbers)):
            if isUsed[i] is False:
                isUsed[i] = True
                cur += numbers[i]
                select(k+1)
                cur = cur[:-1]
                isUsed[i] = False
                
    select(0)
    return result
    

def isPrime(num):
    if num < 2:
        return False
    
    i = 2
    while i*i <= num:
        if num % i == 0:
            return False
        i += 1
    
    return True