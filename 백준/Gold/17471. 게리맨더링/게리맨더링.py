from collections import deque

def bfs(mask, graph, N):
    
    queue = deque()
    
    for i in range(1, N+1):
        if mask & (1 << i):
            queue.append(i)
            mask &= ~(1 << i)
            break

    while queue:
        cur = queue.popleft()
        
        for near in graph[cur]:
            if mask & (1 << near):
                queue.append(near)
                mask &= ~(1 << near)
    
    return mask == 0
    

def solution(P, A):
    # mask로 group을 2개로 나눌거임
    # 나누고 BFS로 각각 이어짐을 확인
    # 인구수 비교 갱신
    N = len(P)
    graph = [[] for _ in range(N+1)]
    
    for i in range(N):
        graph[i+1] = A[i][1:]
        
    total = sum(P)
    min_diff = float('inf')
    
    for mask in range(1 << 1, (1 << (N+1)) - 1):
        
        full = (1 << (N+1)) - 2
        other = mask ^ full
        
        if bfs(mask, graph, N) and bfs(other, graph, N):
            p = 0
            
            for i in range(1, N+1):
                if mask & (1 << i):
                    p += P[i-1]
            
            min_diff = min(min_diff, abs(total - 2*p))
        
    return min_diff if min_diff != float('inf') else -1

def main():
    N = int(input())
    P = list(map(int, input().split()))
    A = [list(map(int, input().split())) for _ in range(N)]
    print(solution(P, A))

if __name__ == "__main__":
    main()