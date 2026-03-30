# 도둑 > 체육복 도난
# 여벌 > 빌려주기

# 1 2 3 4 5 > 앞 혹은 뒤에게만 빌려줄 수 있다 
# 최대한 많은 학생이 수업

# n명의 학생
# [1,2,3] lost 배열
# [1,2,3] reserve 배열

# 수업 듣는 최대 학생수

# n: 2~30명
# 여벌 & 도난이면 빌려줄 수 없다

# [도난, 여분]
# loop돌면서
    # 앞 (도난 & 현재 X) & 현재 (도난 X & 여벌 O) 앞으로 전달

def solution(n, lost, reserve):
    
    arr = [[0, 0] for _ in range(n)]
    
    for l in lost:
        arr[l-1][0] = 1
    
    for r in reserve:
        if arr[r-1][0] == 1:
            arr[r-1][0] = 0
            continue
        arr[r-1][1] = 1
    
    for i in range(n):
        i_lost, i_reserve = arr[i]
            
        # 앞 사람 체크 (lost이면)
        if i and arr[i-1][0] and i_reserve:
            arr[i-1][0] = 0
            arr[i][1] = 0
            continue
        
        # 뒷 사람 체크
        if i+1 < n and arr[i+1][0] and i_reserve:
            arr[i+1][0] = 0
            arr[i][1] = 0
            continue
            
    return n - sum(list(map(lambda x: x[0], arr)))

# 19분 소요