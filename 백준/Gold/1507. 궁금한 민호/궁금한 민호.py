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
    
    needed = [[True] * N for _ in range(N)]
    
    for k in range(N):
        for i in range(N):
            for j in range(N):

                if i == j: continue
                if i == k: continue
                if j == k: continue
                    
                if A[i][j] == A[i][k] + A[k][j]:
                    needed[i][j] = False
                
                elif A[i][j] > A[i][k] + A[k][j]:
                    return -1
    
    answer = 0
    for i in range(N):
        for j in range(N):
            if needed[i][j]:
                answer += A[i][j]
    
    return answer // 2

def main():
    N = int(input())
    A = []
    for _ in range(N):
        A.append(list(map(int, input().split())))
    print(solution(N, A))

if __name__ == "__main__":
    main()