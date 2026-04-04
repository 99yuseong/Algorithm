# 매 게임마다 건물 순서가 변경
# delay가 존재

# 순서 > 최소시간을 알아내는 프로그램 > 위상정렬DP

# N: 2~1000 (V)
# K: 1~10만 (E)
# W: 목표 건물
# D: 0~10만

# DP[i]: i를 건설하기 위한 최소시간 (적어도 필요한 시간)
# DP[nxt] = max(DP[nxt], DP[cur]+D[nxt])
# DP[W]를 리턴

from collections import deque

def solution(N, D, A, W):
    
    indegree = [0] * (N+1)
    graph = {}

    for x, y in A:
        graph.setdefault(x, []).append(y)
        indegree[y] += 1
        
    dp = [0] + D[:]
    queue = deque()
    
    for i in range(1, N+1):
        if indegree[i] == 0:
            queue.append(i)
    
    while queue:
        cur = queue.popleft()
        
        for v in graph.get(cur, []):
            dp[v] = max(dp[v], dp[cur] + D[v-1])
            
            indegree[v] -= 1
            if indegree[v] == 0:
                queue.append(v)
    
    return dp[W]

def main():
    T = int(input())
    result = []
    for _ in range(T):
        N, K = map(int, input().split())
        T = list(map(int, input().split()))
        A = []
        for _ in range(K):
            A.append(list(map(int, input().split())))
        W = int(input())
        result.append(solution(N, T, A, W))
    print("\n".join(map(str, result)))

if __name__ == "__main__":
    main()