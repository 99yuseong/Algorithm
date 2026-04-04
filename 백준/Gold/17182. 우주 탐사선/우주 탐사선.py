# 우주탐사선 > 행성 탐사
# 모든 행성을 탐사하는 데 걸리는 최소 시간

# 행성의 개수
# 행성 위치와 행성간 이동 걸리는 시간 > 

# 모든 행성을 탐사하는데 걸리는 최소 시간
# 이미 방문한 행성도 중복해서 갈 수 있따.

# 각 행성간 이동 경로가 나와있음
# 일단 최단 경로는 아님. 

# MST + 최단경로 같은데

# 행성 수 > 10개
# K에서 출발 > 정렬

# K를 제외한 경우의 수 > 9! > 대강 36000정도

# 플로이드 > 10 * 10 * 10 > O(1000)
# 각 위치에서 이동하는 최단 거리 연산

# permu로 경우의수 계산 
    # 해당 경로로 이동하는 최솟값을 합연산
    # 최솟값을 갱신 후 리턴
    
from itertools import permutations

def solution(N, K, A):
    
    # 플로이드 최단 경로 연산 O(10^3)
    for k in range(N):
        for i in range(N):
            for j in range(N):
                A[i][j] = min(A[i][j], A[i][k] + A[k][j])
    
    target = [x for x in range(N) if x != K]
    min_t = 1000 * 1000
    
    for mv_case in list(permutations(target, len(target))):

        mv_case = list(mv_case) # 길이 N-1개의 행성
        cur_t = A[K][mv_case[0]] # K -> 0번쨰로 이동
        
        for i in range(N-2): # 0 -> 1, 1 -> 2 , ... 이동
            cur_t += A[mv_case[i]][mv_case[i+1]]
        
        min_t = min(cur_t, min_t)
        
    return min_t

def main():
    N, K = map(int, input().split())
    A = []
    for _ in range(N):
        A.append(list(map(int, input().split())))
    print(solution(N, K, A))

if __name__ == "__main__":
    main()