def is_same(s1, s2):
    return (s1 == "(" and s2 == ")") or (s1 == "[" and s2 == "]") or s1 == "{" and s2 == "}"

def is_right(s):
    
    stack = []
    
    for _ in range(len(s)):
        if stack and s and is_same(s[-1], stack[-1]):
            s = s[:-1]
            stack.pop()
        else:
            char = s[-1]
            s = s[:-1]
            stack.append(char)
            
    return len(stack) == 0

def solution(s):
    
    ss = s + s
    
    answer = 0
    
    for i in range(len(s)):
        if is_right(ss[i:i+len(s)]):
            answer += 1
    
    return answer