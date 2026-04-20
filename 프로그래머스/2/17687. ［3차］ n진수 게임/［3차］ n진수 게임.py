# 둥글게 숫자 하나씩

# 0 ~ 

# n진법: 2~16
# t개: 1 ~1000개
# m명: 2~100명
# 순서p: 1~m

# p + m * t 만큼 말해야함
# 1 ~ p + m * t

def num_to_nth(num, n):
    
    A = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    
    ans = []
    
    while num >= n:
        remain = num % n
        ans.append(f"{A[remain]}")
        num //= n
    ans.append(f"{A[num]}")
    
    return ans[::-1]

def solution(n, t, m, p):
    
    order = []
    result = []
    
    cur_num = 0
    
    while len(result) < t: # 10만번    
        order += num_to_nth(cur_num, n)
        
        if p-1 < len(order):
            result.append(order[p-1])
            p += m
        
        cur_num += 1
        
    return "".join(result)