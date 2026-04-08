# 1~n번 배양체 n-1개로 연결

# A, B, C 중 1개다.
# 열린 파이프를 통해 감염

# A, B, C를 각가 열었다가 닫았다가 하면서 k번 반복해 감염

# n: 2~100
# 최초 감염은 1개
# k = 10

# 3^10의 경우의 수 -> 59049개의 경우의 수 * 100개를 감염

from itertools import product
from collections import deque

def solution(n, infection, edges, k):
    
    graph = {}
    
    for x, y, type in edges:
        graph.setdefault(x, []).append((y, type))
        graph.setdefault(y, []).append((x, type))
    
    max_infection = 1
    
    # 3^k의 경우의 수로 문을 여는 것을 확정
    for opens in product([1, 2, 3], repeat=k):
        
        # i번째 오픈에서 BFS로 감염을 전파
        infections = [infection]
        visited = [False] * (n+1)
        queue = deque()
        visited[infection] = True
        
        for open in list(opens):
            
            for start_infection in infections:
                queue.append(start_infection)
            
            while queue:
                cur = queue.popleft()
                for v, type in graph.get(cur, []):
                    if open != type or visited[v]: continue
                    queue.append(v)
                    visited[v] = True
                    infections.append(v)

        max_infection = max(max_infection, len(infections))
                    
    return max_infection