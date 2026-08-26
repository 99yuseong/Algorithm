# 한자리 숫자

# 7! -> 4320개 경우의 수

from itertools import permutations

def isPrime(num):
    
    if num < 2:
        return False
    
    i = 2
    while i * i <= num:
        if num % i == 0:
            return False
        i += 1
    return True

def solution(numbers):
    
    numbers = list(map(int, numbers))
    
    s = set()
    
    for r in range(1, len(numbers) + 1):
        for p in permutations(numbers, r):
            num = int(''.join(map(str, p)))
              
            if isPrime(num):
                s.add(num)

    return len(s)