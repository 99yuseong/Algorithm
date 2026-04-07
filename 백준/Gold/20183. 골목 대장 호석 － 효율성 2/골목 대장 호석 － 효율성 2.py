# N개의 교차로. M개의 골목
# 교차로에서의 요금을 최소화

# 전체 경로를 갈 수 있으면서, 해당 경로에서의 최대 요금이 최소가 되도록
# 갈수 없다면 -1
# 한 골목에서 내야하는 최솟값

# 1. 갈 수 있으면 된다.
# 2. 목표는 해당 경로에서 한 골목에서 내는 최대 요금의 최솟값이다.

# N [교차로 V] 1~10만 
# M [골목 E] 1~50만
# C [돈] 1~
# 수금액 1~10억

# k가 최대 요금인 경로로만 갈때 C안에 갈 수 있는가?
# 이분탐색으로 찾는 거거든

# check = 다익스트라 O(ElogV)
# 정렬 O(ElgE)
# k를 이분탐색 O(log10^14)

import heapq

def solution(N, R, A, B, C):
    
    max_k = 0
    graph = {}

    for a, b, c in R:
        graph.setdefault(a, []).append((b, c))
        graph.setdefault(b, []).append((a, c))
        max_k = max(max_k, c)

    def can_go(k):
        
        nonlocal N, A, B, C, graph
        
        INF = float('inf')
        p_queue = []
        cost = [INF] * (N+1)
        
        heapq.heappush(p_queue, (0, A))
        cost[A] = 0
        
        while p_queue:
            cur_cost, cur = heapq.heappop(p_queue)
            
            if cost[cur] < cur_cost: continue
            
            for v, c in graph.get(cur, []):
                if cost[cur] + c < cost[v] and c <= k:
                    cost[v] = cost[cur] + c
                    heapq.heappush(p_queue, (cost[v], v))
        
        return cost[B] <= C
    
    s = 1
    e = max_k
    
    if can_go(max_k) is False:
        return -1
    
    while s < e:
        mid = (s + e) // 2
        
        if can_go(mid):
            e = mid
        else:
            s = mid + 1
            
    return s
        
def main():
    N, M, A, B, C = map(int, input().split())
    R = []
    for _ in range(M):
        R.append(list(map(int, input().split())))
    print(solution(N, R, A, B, C))

if __name__ == '__main__':
    main()
