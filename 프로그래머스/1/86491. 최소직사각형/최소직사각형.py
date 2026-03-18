# 지갑의 크기
# 모두 수납 가능하면서 작은 크기
# 모든 지갑을 수납할 수 있는 가장 작은 지갑의 크기

# n: 1~1만
# 회전이 가능하다.
# 큰, 작은으로 각각 max
# O(1만)

def solution(sizes):
    
    max_w = -1
    max_h = -1
    
    # 항상 가로가 긴 지갑 생성
    for size in sizes:
        max_w = max(max_w, max(size))
        max_h = max(max_h, min(size))
    
    return max_w * max_h

# 3:38초