# N개의 도시
# M개의 버스
# A -> B 비용을 최소화

# N: 1~1천
# M: 1~10만
# 비용은 1~10만사이 > 다합쳐도 1억

# A -> B 비용 다익스트라

import heapq

def solution(N, A, start, end):
    
    INF = float('inf')
    
    graph = {}
    for s, e, c in A:
        graph.setdefault(s, []).append((e, c))
    
    cost = [INF] * (N+1)
    p_queue = []
    heapq.heappush(p_queue, (start, 0))
    cost[start] = 0
    
    while p_queue:
        cur, cur_cost = heapq.heappop(p_queue)
        
        if cost[cur] < cur_cost: 
            continue
        
        for nxt, nxt_cost in graph.get(cur, []):
            if cost[cur] + nxt_cost < cost[nxt]:
                cost[nxt] = cost[cur] + nxt_cost
                heapq.heappush(p_queue, (nxt, cost[nxt]))
        
    return cost[end]

def main():
    N = int(input())
    M = int(input())
    A = []
    for _ in range(M):
        A.append(list(map(int, input().split())))
    S, E = map(int, input().split())
    print(solution(N, A, S, E))

if __name__ == "__main__":
    main()