# begin, target
# begin > target

# 1개의 알파벳 변경
# words에 있는 단어로만 변환

# 최소 몇단계로 변환? 불가능시 0

# 길이는 10 > 
# 50개의 단어 - 최대 50번 변경

# 0. target이 words안에 있는가? 확인 > 0


# 1. 문자열이 1개만 다른거를 매핑 [graph]
# 2. BFS로 변경하면서 visited + 1
# 3. 최종 target 도착시 리턴, 아니라면 0

from collections import deque

def solution(begin, target, words):
    
    if target not in words:
        return 0
    
    # graph 매핑
    
    graph = {}
    for word1 in words:
        for word2 in words:
            if word1 == word2:
                continue
                
            diff = 0
            for i in range(len(word1)):
                if diff > 1: break
                if word1[i] != word2[i]: 
                    diff += 1
        
            if diff == 1:
                graph.setdefault(word1, []).append(word2)
    
    visited = {}
    for word in words:
        visited.setdefault(word, -1)
    queue = deque()
    
    for i in range(len(words)):
        word = words[i]
        diff = 0
        
        for j in range(len(word)):
            if diff > 1: break
            if begin[j] != word[j]:
                diff += 1
        
        if diff == 1:
            queue.append(word)
            visited[word] = 1
    
    
    while len(queue) > 0:
        cur = queue.popleft()
        
        if cur == target:
            return visited[cur]
        
        for v in graph.get(cur, []):
            if visited[v] == -1:
                visited[v] = visited[cur] + 1
                queue.append(v)
    
    return 0