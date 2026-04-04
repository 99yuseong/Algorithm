# 장난감으로 부품 조립
# 기본 부품 > 조립 > 중간 부품

# 부품과 개수 > 노드가 중복되겠는데.

# 필요한 기본 부품의 종류별 개수

# N: 3~99개의 부품, N = 완제품
# 필요한 부품의 관계 [X, Y, K] = X: Y가 K개 필요

# [0] * (N) > graph를 만들면서 필요한 cnt++
# 여기서 outdegree가 0인 요소가 중간 부품임

from collections import deque

def solution(N, A):
    
    graph = {}
    indegree = [0] * (N+1)
    outdegree = [0] * (N+1) # 1~N까지
    
    for x, y, k in A:
        graph.setdefault(x, []).append((y, k))
        outdegree[x] += 1
        indegree[y] += 1

    # 위상정렬순서 순회 > 기본 부품이면 cnt++
    cnt = [0] * (N+1)
    cnt[N] = 1
    queue = deque()
    queue.append(N)
    
    while queue:
        cur = queue.popleft()
        
        for v, k in graph.get(cur, []):
            
            # cur을 만드는데 필요한 개수를 카운트
            cnt[v] += cnt[cur] * k
            
            indegree[v] -= 1
            if indegree[v] == 0:
                queue.append(v)
    
    result = []
    for i in range(1, N):
        if outdegree[i] == 0: # 기본 부품
            result.append((i, cnt[i]))
            
    return sorted(result) # 작은 것에서 큰 순서대로 출력

def main():
    N = int(input())
    M = int(input())
    A = []
    for _ in range(M):
        A.append(list(map(int, input().split())))

    result = solution(N, A)
    print("\n".join(map(lambda x: f"{x[0]} {x[1]}", result)))

if __name__ == "__main__":
    main()