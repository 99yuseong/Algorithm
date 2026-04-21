# 3번 다트 > 합계

# 0 ~ 10점

# S D T
# 스타상 > 지금 & 이전 점수 2배 
# 아차상 > 지금 점수 마이너스

# [S, D, T]가 나올때까지 더함
# [S, D, T]가 나오면 연산

def solution(dartResult):
    
    SCORE = []
    
    i = 0
    
    while True:
        
        if len(SCORE) >= 3: 
            break
        
        score = ""
        while i < len(dartResult) and dartResult[i] not in ["S", "D", "T"]:
            score += dartResult[i]
            i += 1
        
        score = int(score)
        
        bonus = dartResult[i]
        i += 1
        
        if bonus == "D":
            score = score ** 2
        elif bonus == "T":
            score = score ** 3
        
        if i < len(dartResult):
            option = dartResult[i]
        
            if option == "*":
                if SCORE:
                    SCORE[-1] = SCORE[-1] * 2
                score *= 2
                i += 1

            elif option == "#":
                score *= (-1)
                i += 1
        
        SCORE.append(score)
        
    return sum(SCORE)