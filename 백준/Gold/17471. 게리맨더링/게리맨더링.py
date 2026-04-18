from collections import deque

def bfs(group_mask, graph, N):
    queue = deque()

    for i in range(N):
        if group_mask & (1 << i):
            queue.append(i)
            group_mask &= ~(1 << i)
            break

    while queue:
        cur = queue.popleft()

        for near in graph[cur]:
            if group_mask & (1 << near):
                queue.append(near)
                group_mask &= ~(1 << near)

    return group_mask == 0

def solution(P, A):
    N = len(P)

    # 0-index 그래프
    graph = [[] for _ in range(N)]
    for i in range(N):
        for near in A[i][1:]:
            graph[i].append(near - 1)

    total = sum(P)
    min_diff = float('inf')
    full = (1 << N) - 1

    for mask in range(1, (1 << N) - 1):
        other = full ^ mask

        if bfs(mask, graph, N) and bfs(other, graph, N):
            p = 0
            for i in range(N):
                if mask & (1 << i):
                    p += P[i]

            min_diff = min(min_diff, abs(total - 2 * p))

    return -1 if min_diff == float('inf') else min_diff

def main():
    N = int(input())
    P = list(map(int, input().split()))
    A = [list(map(int, input().split())) for _ in range(N)]
    print(solution(P, A))

if __name__ == "__main__":
    main()