# 우승자 상품 지급
# +, -, * 으로만 이루어진 수식 전달

# 가장 큰 숫자를 제출하는 사람이 승리
# 우선 순위를 재정의

# 3!개 만큼의 조합이 가능

# 음수라면 절댓값으로 제출

# return 가장 큰 절댓값

# 3~100 길이 문자열
# 숫자는 0 ~ 999

# 음수 수식은 없음


# 연산자 > 최대 49개

# 6가지 경우의 수 * 최대 5회의 숫자연산 * 50

# 1. split "숫자", "기호", "숫자"

def split_expression(expression):
    
    arr_expression = []
    
    num = ""
    cur_idx = 0
    
    while cur_idx < len(expression):
        
        if not expression[cur_idx] in "-*+":
            num += expression[cur_idx]    
        else:
            arr_expression.append(num)
            arr_expression.append(expression[cur_idx])
            num = ""
            
        cur_idx += 1
        
    if num:
        arr_expression.append(num)
        
    return arr_expression

def find_operator(arr_expression):
    return set(filter(lambda x: x in "-+*", arr_expression))

def calculate(x, op, y):
    x, y = int(x), int(y)
    
    if op == "+":
        return x + y
    elif op == "*":
        return x * y
    else:
        return x - y

from itertools import permutations

def solution(expression):
    
    arr_expression = split_expression(expression)
    operator = find_operator(arr_expression)
    
    max_result = -1
    
    for ops in permutations(operator, len(operator)): # O(6)
        cur_arr_expression = arr_expression[:] # 복사
        for op in ops: # O(3)
            new_arr_expression = []
            i = 0
            while i < len(cur_arr_expression): # O(n)
                if cur_arr_expression[i] == op:
                    x = new_arr_expression.pop()
                    y = cur_arr_expression[i+1]
                    new_arr_expression.append(calculate(x, op, y))
                    i += 2
                else:
                    new_arr_expression.append(cur_arr_expression[i])
                    i += 1
            cur_arr_expression = new_arr_expression
            
        max_result = max(max_result, abs(cur_arr_expression[0]))
    
    return max_result