# 음이 아닌 정수
# 더하거나 빼서
# 0에서 더할거냐 뺄거냐

# 2^20 > 1024 * 1024
# DFS

def solution(numbers, target):
    
    answer = 0
    cur = 0
    
    def cal(k):
        nonlocal cur, answer
        
        if k == len(numbers):
            if cur == target:
                answer += 1
            return
        
        num = numbers[k]
        
        cur += num
        cal(k+1)
        cur -= num
        
        cur -= num
        cal(k+1)
        cur += num
    
    cal(0)
    
    return answer