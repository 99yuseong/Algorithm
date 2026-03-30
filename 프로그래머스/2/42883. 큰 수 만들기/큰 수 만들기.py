# 우선 max를 찾고 k개보다 작다 > 그만큼 제거

# 앞자리가 크면 장땡
# k자리중 max
# k자리중 max
# ... K(k+1)/2 > 100만 * 100만이라 문제인거임

# 뺄때 앞자리에 있을 수록, 숫자가 작을수록 빼는 거지

# stack으로 하면? 

def solution(number, k):
    
    n = len(number)
    stack = []
    rm = 0
    
    # 큰 수 순서대로 누적하면서 빼기
    for i in range(n):
        num = number[i]
        while k > rm and stack and num > stack[-1]:
            stack.pop()
            rm += 1
        stack.append(num)
        
    return ''.join(stack[:n-k])