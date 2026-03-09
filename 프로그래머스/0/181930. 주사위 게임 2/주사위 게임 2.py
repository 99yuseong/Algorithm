# 점수가 모두 다르면 a+b+c

def solution(a, b, c):
    
    if a != b and b != c and a != c:
        return a+b+c
    elif a == b and b == c and a == b:
        return (a+b+c)*(a*a+b*b+c*c)*(a*a*a+b*b*b+c*c*c)
    else:
        return (a+b+c)*(a*a+b*b+c*c)