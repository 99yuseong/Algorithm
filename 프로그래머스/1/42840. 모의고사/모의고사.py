# 

def solution(answers):
    
    p1 = [1, 2, 3, 4, 5]
    p2 = [2, 1, 2, 3, 2, 4, 2, 5]
    p3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    p1 = p1 * (int(10000 / len(p1)) + 1)
    p2 = p2 * (int(10000 / len(p2)) + 1)
    p3 = p3 * (int(10000 / len(p3)) + 1)
    
    s1, s2, s3 = 0, 0, 0
    
    for i in range(len(answers)):
        s1 += 1 if answers[i] == p1[i] else 0
        s2 += 1 if answers[i] == p2[i] else 0
        s3 += 1 if answers[i] == p3[i] else 0
    
    m = max(s1, s2, s3)
    answer = []
    if s1 == m:
        answer.append(1)
    if s2 == m:
        answer.append(2)
    if s3 == m:
        answer.append(3)
    
    return answer