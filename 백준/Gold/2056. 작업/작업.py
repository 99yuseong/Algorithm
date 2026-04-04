# 작업 N개 3~1만개
# 각 작업별 시간 > 1~100초

# 선행관계 > 먼저 완료 필요하다.
# 모든 작업을 완료하기 위해 필요한 최소 시간

# T[i]: i+1번 작업 소요 시간
# A[i]: i+1번 작업보다 선행되어야하는 작업 리스트

# 선행관계 = 위상정렬 & 최소 시간 > 위상정렬 DP
# 위상정렬에서 DP를 채우게 되는 구조
    # DP[nxt] = max(DP[nxt], PP[cur] + T[nxt])

# N: 1만개, 관계는 5천만 > 위상 정렬 가능
    
    
from collections import deque
    
def solution(N, T, A):
    
    indegree = [0] * (N+1)
    graph = {}
    
    for i in range(N):
        for j in range(len(A[i])):
            graph.setdefault(A[i][j], []).append(i+1)
        indegree[i+1] += len(A[i])
    
    queue = deque()
    dp = [0] + T[:]
    
    for i in range(1, N+1):
        if indegree[i] == 0:
            queue.append(i)
            
    while queue:
        cur = queue.popleft()
        
        for v in graph.get(cur, []): # 선행관계가 있어야만 여기를 돔
            indegree[v] -= 1
            dp[v] = max(dp[v], dp[cur] + T[v-1]) # 선행관계가 있는 것중
            
            if indegree[v] == 0:
                queue.append(v)
    
    return max(dp)

def main():
    N = int(input())
    # T n A
    A = []
    T = []
    for _ in range(N):
        arr = list(map(int, input().split()))
        T.append(arr[0])
        A.append(arr[2:])
    
    print(solution(N, T, A))

if __name__ == "__main__":
    main()