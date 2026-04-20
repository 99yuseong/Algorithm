# 메세지 압축 > 무손실 압축 알고리즘

# LZW

# 길이가 1인 모든 단어를 포함하도록

# 기본 사전
# 가장 긴 문자열 w를 사전에서 찾는다. loop(사전에서 가장 긴 문자열 길이 -= 1)
# 색인 번호 출력 w를 제거
# w+c를 사전에 등록

# w > 값을 찾으려면 dict로 저장
# 색인 번호가 필요하다.
# { w: index }

# msg: 1~1000글자

from collections import deque

def solution(msg):
    
    ALPA = [
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
        "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
    ]
    
    dict = {}
    for i, a in enumerate(ALPA):
        dict.setdefault(a, i+1)
        
    queue = deque()
    for char in msg:
        queue.append(char)
        
    answer = []
    
    while queue:
        w = queue.popleft() # 알파벳 하나
        
        while queue and dict.get(w + queue[0], -1) != -1:
            w += queue.popleft()
        
        answer.append(dict[w])
        
        if queue:
            dict.setdefault(w + queue[0], len(dict) + 1)
        
    return answer

