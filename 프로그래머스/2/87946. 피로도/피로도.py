# 피로도 (0이상의 정수)
# 최소 피로도 & 소모피로도
# 최대한 많이 탐험
# 최대 던전 수를 리턴

# k: 1~5000 (현재 체력)

# 인덱스 단위의 던전

# 그리디 > 근데 이전 탐험이 이후에 영향을 주네?

# 8!의 경우의 수
# 다 해보자


# 8개를 나열하는 경우의 수 > 8! > 약 5600개
# 8개씩 돌면서 연산 > 

def solution(k, dungeons):
    
    explore_cnt = 0
    
    for idx_arr in permu(len(dungeons)):
        
        cur_k = k
        cur_explore = 0
        
        for idx in idx_arr:
            
            if cur_k >= dungeons[idx][0]:
                cur_k -= dungeons[idx][1]
                cur_explore += 1
            
            else:
                break
        
        explore_cnt = max(explore_cnt, cur_explore)
        
    return explore_cnt

def permu(n):
    
    result = []
    cur = []
    isUsed = [False] * n
    
    def select(k):
        nonlocal cur
        
        if n == k:
            result.append(cur)
            return
        
        for i in range(n):
            if isUsed[i] is False:
                isUsed[i] = True
                cur.append(i)
                select(k+1)
                cur = cur[:-1]
                isUsed[i] = False
        
    select(0)
    
    return result
    
    
    