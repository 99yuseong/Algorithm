def solution(participant, completion):
    
    dict = {}
    
    for man in participant:
        if man in dict:
            dict[man] += 1
        else:
            dict[man] = 1
            
    for man in completion:
        if man in dict:
            dict[man] -= 1
        else:
            break
    
    answer = ''
    for k, v in dict.items():
        if v == 1:
            answer = k
            break
            
    return answer


# 한명만 완주 못함
# 참여한 선수 이름 / 완주한 선수 이름
# 완주 못한사람을 리턴해라

# 10만 - O(N^2)
# 알파벳 소문자로 구성
# 동명이인 가능