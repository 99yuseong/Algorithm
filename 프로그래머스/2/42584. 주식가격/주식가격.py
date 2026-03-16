# 초 단위 > 주식가격
# 가격이 떨어지지 않은 기간은 몇초?

# n: 2~10만
# 10만 * 10만으로 모두 체크하면 시간 초과

# [price, idx] price가 증가하는 건 담고, 감소하면 빼고

def solution(prices):

    n = len(prices)
    answer = [0] * n
    stack = []
    
    for t in range(n):
        
        # 떨어졌다면
        while len(stack) > 0 and prices[t] < stack[-1][0]:
            v = stack.pop()
            answer[v[1]] = t - v[1] 
        
        else:
            stack.append([prices[t], t])
    
    for i in range(n):
        if answer[i] == 0:
            answer[i] = n - (i+1)
            

    return answer