# 1번부터 N개의 문제집
# 난이도 순서대로 출제 
# 먼저 푸는 것이 좋은 문제가 있다. > 선이수 과목 > 위상정렬

# N개를 모두 풀어야한다.
# 먼저 푸는 것이 좋으면 먼저
# 쉬운 문제 부터
# 1. 먼저, 2. 쉬운 순으로 정렬

# 문제 V : 3.2만
# 정보 E : 10만

# 위상 정렬인데 > 정렬 조건이 추가된다.
# 위상 정렬에서 같은 순서일때 > 이건 우선순위 큐로 구현하면 될듯한데. heap으로

# 모든 heappush, heappop에서 logN
# O(V + ElogV)

import heapq

def solution(N, A):
    
    graph = {}
    indegree = [0] * (N+1)
    p_queue = []
    result = []
    
    for p1, p2 in A:
        graph.setdefault(p1, []).append(p2)
        indegree[p2] += 1
    
    for i in range(1, N+1):
        if indegree[i] == 0:
            heapq.heappush(p_queue, i)
    
    while p_queue:
        cur = heapq.heappop(p_queue)
        result.append(cur)
        
        for v in graph.get(cur, []):
            indegree[v] -= 1
            if indegree[v] == 0:
                heapq.heappush(p_queue, v)
    
    return result

def main():
    N, M = map(int, input().split())
    A = []
    for _ in range(M):
        A.append(list(map(int, input().split())))
    
    result = solution(N, A)
    print(" ".join(list(map(str, result))))

if __name__ == "__main__":
    main()