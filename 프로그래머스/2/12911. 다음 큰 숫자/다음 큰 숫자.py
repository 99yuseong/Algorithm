def solution(n):
    
    oneCnt = bin(n).count("1")
    
    while True:
        if bin(n+1).count("1") == oneCnt:
            return n+1
        n += 1