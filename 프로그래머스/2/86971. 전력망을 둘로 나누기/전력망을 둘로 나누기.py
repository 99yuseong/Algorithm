# @time 17
# @tags BFS

from collections import deque, defaultdict

def solution(n, wires):
    
    answer = n-1
    graph = defaultdict(list)
    
    for w1, w2 in wires:
        graph[w1-1].append(w2-1)
        graph[w2-1].append(w1-1)
    
    
    for w1, w2 in wires:
        
        visited = [0 for _ in range(n)]
        queue = deque()
        
        queue.append(w1-1)
        visited[w1-1] = 1
        
        while queue:
            cur = queue.popleft()
            
            for next in graph[cur]:
                if (
                    visited[next] == 0 
                    and not (next == w1-1 and cur == w2-1) 
                    and not (next == w2-1 and cur == w1-1)
                ):
                    queue.append(next)
                    visited[next] = 1
        
        c1 = sum(visited)
        c2 = n - c1
        
        answer = min(answer, abs(c1 - c2))
        
    return answer