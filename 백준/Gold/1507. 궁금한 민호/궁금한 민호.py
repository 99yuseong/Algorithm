# N개의 도시로 이루어진 나라
# M개의 도로로 연결
# 도시 - 도시 > 시간

# 모든 도시는 연결되어 있다.

# 최소 이동 시간 > 도로가 몇개?
# 모든 도로의 시간의 합

# N: 20개의 도시
# 양방향 도로. 시간은 항상 2500이하
# 도로 개수가 최소일때, 모든 도로의 시간의 합


# 20개의 도시 

def solution(N, A):
    
    D = [[0] * N for _ in range(N)]
    
    is_always_false = False
    
    for k in range(N):
        for i in range(N):
            for j in range(N):
                if is_always_false: break
                if i == j: continue
                if i == k: continue
                if j == k: continue
                    
                if A[i][j] == A[i][k] + A[k][j]:
                    D[i][j] = 1
                elif A[i][j] > A[i][k] + A[k][j]:
                    is_always_false = True
    
    if is_always_false:
        return -1
    
    sum_t = 0
    for i in range(N):
        for j in range(N):
            if D[i][j] == 0:
                sum_t += A[i][j]
    
    return sum_t // 2

def main():
    N = int(input())
    A = []
    for _ in range(N):
        A.append(list(map(int, input().split())))
    print(solution(N, A))

if __name__ == "__main__":
    main()