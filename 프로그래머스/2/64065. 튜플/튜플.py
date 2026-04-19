# 원소가 n개, 중복되는 원소가 없는 튜플

# s > 튜플을 만들어 리턴해라

# a1, {a1, a2} , ... 이런식으로 나올때.
# 가장 큰 튜플이 전체 요소이고, 이전 애들이 순서를 결정한다.


# s: 5 ~ 100만
# 500개 이하의 원소만 주어진다.


def solution(s):
    
    # 1. s를 가공: set 단위로 가공.
    # 2. a - b로 남은것만 배열에 추가하면서 확장
    # 최종 배열 리턴
    
    tuples = []
    cur_idx = 1
    
    while cur_idx < len(s) - 1:
        
        if s[cur_idx] == "{":
            cur_idx += 1
            
            words = ""
            while cur_idx < len(s) - 1 and s[cur_idx] != "}":
                words += s[cur_idx]
                cur_idx += 1
            tuples.append(set(map(int, words.split(','))))
            cur_idx += 1
        
        cur_idx += 1
    
    tuples.sort(key=lambda x: len(x))
    
    total_set = set()
    answer = []
    
    for cur_set in tuples:
        num = (cur_set - total_set).pop()
        answer.append(num)
        total_set.add(num)
    
    return answer