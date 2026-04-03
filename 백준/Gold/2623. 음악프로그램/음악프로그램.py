# 출연 순서 > 조건을 따진 순서
# PD들의 조건을 모두 만족하도록 순서 정하기
# 불가능? > 순환이 만들어질 경우

# N: 가수 - 1천명
# M: PD의 수 - 100개의 기준

# 100개를 돌면서 최대 1000개의 나열을 저장한다.

# 100 * 1000 * 1000 개의 데이터를 그래프에 저장
# indegree 카운트 0 인것을 queue에 넣기
# 위상정렬 연산
# 만약 result의 len이 N이 아니라면 불가능 [0] 리턴
from collections import deque

def solution(N, M, A):
    
    indegree = [0] * (N+1)
    graph = {}
    
    for arr in A:
        
        n = arr[0]
        a = arr[1:]

        if n < 2: continue

        for i in range(n):
            for j in range(i+1, n):
                if a[j] not in graph.get(a[i], set()):
                    graph.setdefault(a[i], set()).add(a[j])
                    indegree[a[j]] += 1

    queue = deque()
    result = []
    
    for idx, degree in enumerate(indegree):
        if idx == 0: continue
        if degree == 0:
            queue.append(idx)

    while len(queue) > 0:
        cur = queue.popleft()
        result.append(cur)
        
        for v in graph.get(cur, set()):
            indegree[v] -= 1
            if indegree[v] == 0:
                queue.append(v)
                
    return result if len(result) == N else [0]

def main():
    N, M = map(int, input().split())
    A = []
    for _ in range(M):
        A.append(list(map(int, input().split())))
    result = solution(N, M, A)
    print("\n".join(list(map(str, result))))

if __name__ == "__main__":
    main()