from collections import deque

def solution(N, M, A):

    indegree = [0] * (N+1)
    graph = {}
    
    for s1, s2 in A:
        graph.setdefault(s1, []).append(s2)
        indegree[s2] += 1
    
    queue = deque()
    result = []
    
    for idx, degree in enumerate(indegree):
        if idx == 0: continue # 0번은 제외

        if degree == 0:
            queue.append(idx)
    
    while len(queue) > 0:
        cur = queue.popleft()
        result.append(cur)
        
        for s in graph.get(cur, []):
            indegree[s] -= 1
            
            if indegree[s] == 0:
                queue.append(s)
    
    return result

def main():
    N, M = map(int, input().split())
    A = []
    for _ in range(M):
        A.append(list(map(int, input().split())))
        
    result = solution(N, M, A)
    print(" ".join(map(str, result)))
    
if __name__ == "__main__":
    main()