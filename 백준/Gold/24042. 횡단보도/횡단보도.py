# N개의 지역
# 횡단보도

# 파란불이 들어오는 순서
# M분 주기로 1분마다 신호가 변경
# 한 주기에 여러번 신호가 들어올 수 있다

# 1 > N까지 가는 최소 시간

# N: 2~10만개
# M: 1~70만 주기

# 1. graph 생성 > (v, t) = (지역, 주기)

import heapq

def solution(N, A):
    
    MOD = len(A)
    
    graph = {}
    for i, (a, b) in enumerate(A):
        graph.setdefault(a, []).append((b, i))
        graph.setdefault(b, []).append((a, i))
    
    INF = float('inf')
    time = [INF] * (N+1)
    p_queue = [(0, 1)]
    time[1] = 0
    
    while p_queue:
        cur_t, cur = heapq.heappop(p_queue)
        
        if cur == N:
            return cur_t
        
        if time[cur] < cur_t:
            continue
            
        for v, t in graph.get(cur, []):
            
            # t초에 불이 켜진다.
            # 출발시간 = cost[cur]
            
            wait = (t - cur_t % MOD + MOD) % MOD
            new_t = cur_t + wait + 1
            
            if new_t < time[v]:
                time[v] = new_t
                heapq.heappush(p_queue, (new_t, v))
                
    return -1

def main():
    N, M = map(int, input().split())
    A = []
    for _ in range(M):
        A.append(list(map(int, input().split())))
    print(solution(N, A))
if __name__ == '__main__':
    main()



