# 운영체제의 역할

# 특정 프로세스는 몇번째 실행?

# 우선순위가 높은 순서대로 실행

# 근데 순서가 있고 순회를 한다.
# 앞에서 빼고 뒤로 넣는 구조

# n: 1~100
# 숫자가 클수록 우선순위가 높다.

# 인덱스를 추적해야 한다..

from collections import deque

def solution(priorities, location):

    n = len(priorities)
    queue = deque()
    
    for i in range(n):
        queue.append([priorities[i], i])        
    
    for i in range(1, n+1):
        
        m = -1
        for p, _ in queue:
            m = max(m, p)
        
        while queue[0][0] != m:
            queue.append(queue.popleft())
        
        q = queue.popleft()
        
        if q[1] == location:
            return i
        
    answer = 1    
    return answer