# 징검다리

# 한번 밟으면 숫자가 1줄어든다.
# 0은 밟을 수 없음 > 이때는 여러칸을 건너뛸 수 있다.
# 가장 가까운 디딤돌로만 건너뛴다.


# [디딤돌 숫자], 한번에 건너뛸 수 있는 칸 수 k

# 최대 몇명이 건널 수 있을까

# stones: 1~20만
# 원소: 1~2억

# k 간격까지 넘을 수 있다.

# 연속으로 k칸보다 넘게 있는 경우가 언제인가? 

# 연속된 k칸이 있는 지 확인 > O(20만)
# upperbound

def solution(stones, k):
    
    def canCross(x): # x명이 건널때 가능여부
        nonlocal stones, k
        
        continuous = 0
        
        for stone in stones:
            
            if stone - x <= 0:
                continuous += 1
            else:
                continuous = 0
                
            if continuous >= k:
                return False
            
        return True
    
    st = 0
    en = max(stones)
    
    while st < en:
        mid = (st + en) // 2
        
        if canCross(mid):
            st = mid + 1
        else:
            en = mid
    
    return st