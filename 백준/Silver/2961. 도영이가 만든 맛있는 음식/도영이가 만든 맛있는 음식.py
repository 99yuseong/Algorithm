# N개의 재료
# S맛과 B맛
# S는 곱연산, B는 합연산

# 적절히 추가해서 S와 B의 차이를 최소로
# 적어도 1개 이상 사용할것

# 가장 S - B가 작은 요리

# 각 재료를 넣을지 말지 결정 > 2^N
# nC1 + nC2 + nC3 + ... + nCn을 모두 순회
# 2^N * k

# 비트마스킹을 활용

def solution(SB):

    N = len(SB)
    min_diff = float('inf')

    for mask in range(1 << N):
        if mask == 0: 
            continue # 적어도 1개 이상을 선택
        
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