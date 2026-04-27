# 붕대 감기

# t초 동안 > 1초마다 체력 x 회복
# t초 연속 > 체력 y 추가 회복

# 생존여부
# [t, x, y]

# return health or -1

# 공격시간 - 1000초 
# t가 1000초 도는거라 > 시간 복잡도 OK



def solution(bandage, health, attacks):
    
    t, x, y = bandage
    max_health = health
    time = 0
    
    c = 0
    i = 0
    
    while i < len(attacks):
        if attacks[i][0] == time: # 공격 확인
            health -= attacks[i][1]
            if health <= 0: return -1
            c = 0
            i += 1 
        else: # 연속 확인 + 체력 변화
            c += 1
            if c == t:
                health = min(max_health, health + x + y)
                c = 0
            else:
                health = min(max_health, health + x)
        
        time += 1
        
    return health