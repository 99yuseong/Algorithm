# 문자열 길이 100만


def solution(s):
    
    stack = []
    
    for char in s:
        if not stack:
            stack.append(char)
        elif stack[-1] == char:
            stack.pop()
        else:
            stack.append(char)
    
    return 0 if stack else 1