from collections import deque

def makeQueue(queue, visited, n, m):
    
    for j in range(m-1):
        queue.append([0, j])
        visited[0][j] = 1
    
    for i in range(n-1):
        queue.append([i, m-1])
        visited[i][m-1] = 1
        
    for j in range(m-1, 0, -1):
        queue.append([n-1, j])
        visited[n-1][j] = 1
        
    for i in range(n-1, 0, -1):
        queue.append([i, 0])
        visited[i][0] = 1

def crane(storage, target):
    
    n = len(storage)
    m = len(storage[0])
    
    for i in range(n):
        for j in range(m):
            if storage[i][j] == target:
                storage[i][j] = "-"

def solution(storage, requests):
    
    n = len(storage)
    m = len(storage[0])
    
    storage = list(map(list, storage))
    
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    
    for request in requests:
        
        target = request[0]
        isCrane = len(request) == 2
        
        if isCrane:
            crane(storage, target)
        else:
            queue = deque()
            visited = [[0 for _ in range(m)] for _ in range(n)]
            
            makeQueue(queue, visited, n, m)
            
            while queue:
                c1, c2 = queue.popleft()
                
                for k in range(4):
                    
                    x = c1 + dx[k]
                    y = c2 + dy[k]
                    
                    if (
                        (x >= 0 and x < n)
                        and (y >= 0 and y < m)
                        and visited[x][y] == 0
                        and storage[c1][c2] == "-"
                    ):
                        queue.append([x, y])
                        visited[x][y] = 1
        
            for i in range(n):
                for j in range(m):
                    if visited[i][j] == 1 and storage[i][j] == target:
                        storage[i][j] = "-"
            
    answer = n * m
    for i in range(n):
        for j in range(m):
            answer -= 1 if storage[i][j] == "-" else 0
            
    return answer