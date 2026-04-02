# 모든 차량 > 적어도 1번 카메라를 만나도록
# 최소 몇대의 카메라를 설치?

# n: 1~1만
# [시작, 끝]
# -3만 ~ 3만

# 차들의 주행 거리 > 

# routes를 끝나는 지점이 빠른 순, 시작지점이 빠른 순으로 정렬하고
# route가 끝나는 지점에 설치
    # while 만약 해당 위치가 시작 <= 위치 <= 끝이라면 해당 route도 제거

def solution(routes):
    
    cams = []
    
    routes.sort(key=lambda x: -x[1])
    
    while len(routes) > 0:
        s, e = routes.pop()
        cams.append(e)
        
        while routes and routes[-1][0] <= e <= routes[-1][1]:
            routes.pop()
    
    return len(cams)