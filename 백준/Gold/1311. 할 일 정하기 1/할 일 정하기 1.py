def solution(cost):
    N = len(cost)
    INF = float('inf')
    
    dp = [INF] * (1 << N)
    dp[0] = 0
    
    for mask in range(1 << N):
        person = bin(mask).count('1')
        
        for j in range(N):
            if not (mask & (1 << j)):
                next_mask = mask | (1 << j)
                dp[next_mask] = min(
                    dp[next_mask],
                    dp[mask] + cost[person][j]
                )
    
    return dp[(1 << N) - 1]

def main():
    N = int(input())
    D = []
    for _ in range(N):
        D.append(list(map(int, input().split())))
    print(solution(D))

if __name__ == "__main__":
    main()