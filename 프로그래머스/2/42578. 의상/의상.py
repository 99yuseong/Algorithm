# 다른 옷을 조합

# 종류별 최대 1가지 의상
# 최소 1개 이상의 의상
# 서로 다른 조합의 수

# 1개~30개 사이의 의상
# Dict에 담고 > values * (v+1) ... -1 (선택 안 한 경우)

def solution(clothes):
    
    d = {}
    
    for cloth in clothes:
        d[cloth[1]] = d.get(cloth[1], 0) + 1
        
    answer = 1
    for v in d.values():
        answer *= v+1
        
    return answer - 1