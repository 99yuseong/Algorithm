# @time -1
# @tags DP

# 총 201개의 배열
# 순서를 언제부터 하냐에 따른 값

# 최대 100개의 연산
# > 

# 최댓값 > 최대한 적게 빼는거 아닌가 or 많이 빼고 또 빼던가

# k가 마지막 연산자라고 했을때

# DP[i][k] 


def solution(arr):
    
    nums = []
    ops = []
    
    for x in arr:
        if x in ["+", "-"]:
            ops.append(x)
        else:
            nums.append(int(x))
    
    n = len(nums)
    
    max_dp = [[0] * n for _ in range(n)]
    min_dp = [[0] * n for _ in range(n)]
    
    for i in range(n):
        max_dp[i][i] = nums[i]
        min_dp[i][i] = nums[i]
        
    for length in range(2, n+1):
        for i in range(n - length + 1):
            j = i + length - 1

            cur_max = -float("inf")
            cur_min = float("inf")

            for k in range(i, j):
                if ops[k] == "+":
                    mx = max_dp[i][k] + max_dp[k+1][j]
                    mn = min_dp[i][k] + min_dp[k+1][j]

                else:
                    mx = max_dp[i][k] - min_dp[k+1][j]
                    mn = min_dp[i][k] - max_dp[k+1][j]

                cur_max = max(cur_max, mx)
                cur_min = min(cur_min, mn)

            max_dp[i][j] = cur_max
            min_dp[i][j] = cur_min
        
    return max_dp[0][n-1]