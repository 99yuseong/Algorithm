# 재료가 N개
# 신맛과 쓴맛
# 적어도 1개 이상 / 신맛과 쓴맛의 차이를 작게
# 2^N개에 대해서 > 최소차이를 갱신

def solution(SB):
    
    N = len(SB)
    min_diff = float('inf')
    
    for mask in range(1, 1 << N):
        
        S = 1
        B = 0
        
        for i in range(N):
            if mask & (1 << i):
                S *= SB[i][0]
                B += SB[i][1]

        if abs(S-B) < min_diff:
            min_diff = abs(S-B)

    return min_diff

def main():
    N = int(input())
    SB = []
    for _ in range(N):
        SB.append(list(map(int, input().split())))
    print(solution(SB))

if __name__ == '__main__':
    main()