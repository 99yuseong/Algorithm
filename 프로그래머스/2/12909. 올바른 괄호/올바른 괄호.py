# 괄호 확인
# stack > 10만개의 배열 체크

def solution(s):
    
    stack = []
    for st in s:
        if len(stack) > 0 and st == ')' and stack[-1] == '(':
            stack.pop()
        else:
            stack.append(st)
        
    return len(stack) == 0