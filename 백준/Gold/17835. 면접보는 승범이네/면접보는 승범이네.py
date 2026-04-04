# 신입사원
# N개의 도시 거주 > K개의 도시에 면접장 배치
# 경로는 항상 존재. 단방향

# 가장 먼 도시에서 오는 면접자 > 교통비

# 도시와 거리

# N: 2~10만개 도시
# M: 1~50만 도로
# K: 10만개 면접장

# 면접장에서 가장 먼 도시
# 다중인데, 특정 면접장 > 도시 > 다익스트라 O(10만 lg50만)
    # 모든 면접장에 하면 시간초과
    
# 면접장이 아닌 도시? (보장 안됨)

# 우선 면접장인 도시 > 거리 0
# 면접장이 아닌 도시에 대해서
    # graph로 연결된 애들의 최단 경로 연산

# 임의의 도시 1개 잡아
# > 거기서 확인된 도시는 무조건 해당 도시보다 짧은 거리임 1보다 크니까.
# 그러면 해당 순회에서 n개의 노드를 방문했다면, 방문 안한 애들만 방문하면 됨
# 즉 N개의 노드만 방문하고, E도 해당꺼만 방문

# 방문체크를 하는 다익스트라

import heapq

def solution(N, A, I):
    
    INF = float('inf')
    
    graph = {}
    
    for s, e, c in A:
        graph.setdefault(e, []).append((s, c))
    
    p_queue = []
    cost = [INF] * (N+1)

    for i in I:
        p_queue.append((i, 0))
        cost[i] = 0

    heapq.heapify(p_queue)
    
    while p_queue:
        cur, cur_cost = heapq.heappop(p_queue)
        
        if cost[cur] < cur_cost: continue
        
        for nxt, nxt_cost in graph.get(cur, []):
            if cost[cur] + nxt_cost < cost[nxt]:
                cost[nxt] = cost[cur] + nxt_cost
                heapq.heappush(p_queue, (nxt, cost[nxt]))
    
    max_cost = max(cost[1:])
    
    for i in range(1, N+1):
        if cost[i] == max_cost:
            return [i, max_cost]

def main():
    N, M, K = map(int, input().split())
    A = []
    for _ in range(M):
        A.append(list(map(int, input().split())))
    I = list(map(int, input().split()))
    result = solution(N, A, I)
    print("\n".join(map(str, result)))

if __name__ == "__main__":
    main()