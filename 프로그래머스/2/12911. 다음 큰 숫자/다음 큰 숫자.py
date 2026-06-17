def numToBinary(n):
    bin = ""
    
    while n > 0:
        bin += str(n % 2)
        n = int(n / 2)
    
    return bin[::-1]

def solution(n):
    
    bin = numToBinary(n)
    oneCnt = bin.count("1")
    
    answer = n+1
    
    while True:
        nextBin = numToBinary(answer)
        if nextBin.count("1") == oneCnt:
            return answer
        answer += 1