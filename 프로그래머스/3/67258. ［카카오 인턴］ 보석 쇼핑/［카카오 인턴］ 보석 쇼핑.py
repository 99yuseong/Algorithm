# 오프라인 매장 쇼핑
# 모든 종류를 적어도 1개이상 포함하는 가장 짧은 구간

# 연속 배열 중 모든 종류를 다 포함한 가장 짧은 구간

# return [시작, 끝] 
# n: 1~10만
# 1. set(gems) > 필요한 개수
# 2. i, j > 2중 반복문을 돌면 시간초과 > 10만 * 10만

# 슬라이딩 윈도우
    # 부족하면 뒤가로 확장, 넘치면 앞에서부터 축소
    
# 판가름 > graph로 하고, 0이면 pop

def solution(gems):
    
    n = len(gems)
    k = len(set(gems))
    
    gems = ["-"] + gems
    
    G = {}
    
    st = 1
    en = 1
    
    points = []
    
    while st <= en:
        
        if en <= n and len(G.keys()) < k:
            G.setdefault(gems[en], 0)
            G[gems[en]] += 1
            en += 1
        
        else: # 종류가 k개 이상
            if len(G.keys()) >= k:
                points.append([st, en-1])
                
                if G[gems[st]] == 1:
                    G.pop(gems[st])
                else:
                    G[gems[st]] -= 1
            
            st += 1
    
    points.sort(key=lambda x: (x[1]-x[0], x[0]))
    
    return points[0]