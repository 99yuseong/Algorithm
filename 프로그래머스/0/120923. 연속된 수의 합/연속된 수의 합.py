def solution(num, total):
    n = (total - sum(range(num))) // num
    return list(range(n, n+num))