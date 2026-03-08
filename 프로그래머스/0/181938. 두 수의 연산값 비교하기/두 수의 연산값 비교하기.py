def solution(a, b):
    answer = 0
    n1 = int(str(a) + str(b))
    n2 = 2 * a * b
    return max(n1, n2)