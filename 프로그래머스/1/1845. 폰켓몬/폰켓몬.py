# 홍박사 연구실
# 최대한 많은 종류로 N/2를 선택
# 포켓몬 종류의 개수를 return

def solution(nums):
    n = len(nums)
    return min(n // 2, len(set(nums)))