# @time -1
# @tags BFS

from collections import deque, defaultdict

def diff(w1, w2):
    diff = 0
    for i in range(len(w1)):
        if w1[i] != w2[i]:
            diff += 1
    return diff

def solution(begin, target, words):
    
    n = len(words)
    graph = defaultdict(list)
    
    for i in range(n):
        for j in range(n):
            w1, w2 = words[i], words[j]
            
            dif = diff(w1, w2)
            
            if dif == 1:
                graph[i].append(j)
                graph[j].append(i)
    
    queue = deque()
    visited = [-1 for _ in range(n)]
    
    for i in range(n):
        if diff(begin, words[i]) == 1:
            queue.append(i)
            visited[i] = 1
            
    while queue:
        cur = queue.popleft()
                
        if words[cur] == target:
            return visited[cur]
                
        for next in graph[cur]:
            if diff(words[cur], words[next]) == 1 and visited[next] == -1:
                queue.append(next)
                visited[next] = visited[cur] + 1
            
    return 0