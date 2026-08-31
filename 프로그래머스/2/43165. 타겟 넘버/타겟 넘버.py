def dfs(numbers, target):
    answer = 0
    total = 0
    
    def select(k):
        nonlocal answer, numbers, target, total
        
        if len(numbers) == k:
            if total == target:
                answer += 1
            return
        
        total += numbers[k]
        select(k+1)
        total -= numbers[k]
        
        total -= numbers[k]
        select(k+1)
        total += numbers[k]
        
    select(0)
    
    return answer

def solution(numbers, k):
    return dfs(numbers, k)




# 숫자는 2~20개
# 2 ^ 20의 개수 -> 104만 > Safe