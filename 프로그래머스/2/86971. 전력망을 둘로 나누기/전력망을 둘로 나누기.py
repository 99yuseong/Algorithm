# 송전탑 n개
# 트리 형태
# 2개로 분할하기
# 최대한 비숫하게 맞추기

# 최대한 비슷하게 맞췄을때 > 개수 차이를 리턴

# wires의 선 중 1개를 끊음
# 무조건 1개의 트리 형태

# 1번부터 개수 카운트 BFS로 개수 카운트 > n - k
# abs(k - (n-k))의 min 구해라

# 100개중 1개 고름 * BFS(100) > O(1만)

from collections import deque

def solution(n, wires):
    
    answer = 100
    
    for i in range(0, n):
        
        # 그래프 생성
        graph = {}
        for j in range(len(wires)):
            if i == j: continue # 0 ~ n-1번 제외
            graph.setdefault(wires[j][0], []).append(wires[j][1])
            graph.setdefault(wires[j][1], []).append(wires[j][0])
        
        # BFS로 1부터 카운트
        queue = deque()
        visited = [False] * (n+1)
        
        queue.append(1)
        visited[1] = True
        connected = 1
        
        while len(queue) > 0:
            cur = queue.popleft()
            
            for v in graph.get(cur, []):
                if visited[v] is False:
                    queue.append(v)
                    visited[v] = True
                    connected += 1
        
        answer = min(answer, abs(connected - (n - connected)))
    
    return answer