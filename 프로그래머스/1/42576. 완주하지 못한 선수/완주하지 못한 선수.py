def solution(participant, completion):
    
    count_dict = {}
    
    for p in participant:
        count_dict[p] = count_dict.get(p, 0) + 1
    
    for p in completion:
        count_dict[p] = count_dict.get(p, 0) - 1
    
    for k, v in count_dict.items():
        if v == 1:
            return k

# 10만 - O(N^2)
# 알파벳 소문자로 구성
# 동명이인 가능
        
# 동명이인 처리
        
# 동명이인 -> 단순 set으로 처리 불가
# Dictionay 또는 Counter로 처리
# 효율적인 자료구조, 동명이인 처리, 차집합 로직
# Counter 딕셔너리 서브 클래스 -> 등장횟수, 연산 가능

# 한명만 완주 못함
# 참여한 선수 이름 / 완주한 선수 이름
# 완주 못한사람을 리턴해라