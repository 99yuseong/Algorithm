# 생산성
# h번 이상 인용 - h편이상

# 1000개의 논문
# 큰 순서대로 정렬 > idx+1 == value가 같은 경우 value를 리턴

def solution(citations):
    
    citations.sort(reverse=True)
    
    h_index = 0
    
    for i in range(len(citations)):
        if (i+1) <= citations[i]:
            h_index = max(h_index, i+1)
    
    return h_index