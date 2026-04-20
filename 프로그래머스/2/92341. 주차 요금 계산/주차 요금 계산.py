# 주차요금 - 입차 출차

# 출차없음 > 23:59에 출차

# 기본 시간 이하 > 기본요금
# 기본 시간 초과 > 기본 요금 + 단위요금 * ceil(초과시간 / 단위시간)

# 차량번호가 작은 자동차부터 청구할 주차요금 배열 리턴

# base_t, base_f, unit_t, unit_f

# [시각 차량번호 내역]
# [HH:MM 0000 IN/OUT]
# 시각을 기준으로 오름차순

# 해당 차량 > { 0000: [IN_t, OUT_t, ] } dict로 저장
# 분 단위로 변경

# 1. records를 가공 > dict에 저장

import math
from collections import deque

def solution(fees, records):
    
    base_t, base_f, unit_t, unit_f = fees
    
    IN_OUT = {}
    
    # 데이터 가공 { 0000: [IN_t, OUT_t, IN_t, ...] }
    for record in records:
        HHMM, car_num, state = record.split()
        IN_OUT.setdefault(car_num, deque()).append(HHMM_to_minute(HHMM))
    
    
    parking_fees = [] #  [ (차량번호, 금액) ]
    
    for car_num in IN_OUT.keys():
        
        if len(IN_OUT[car_num]) % 2 == 1:
            IN_OUT[car_num].append(HHMM_to_minute("23:59"))
        
        parking_t = 0
        
        while IN_OUT[car_num]:
            st_t, end_t = IN_OUT[car_num].popleft(), IN_OUT[car_num].popleft()
            parking_t += end_t - st_t
        
        if parking_t <= base_t:
            total_f = base_f
        else:
            total_f = base_f + unit_f * math.ceil((parking_t - base_t) / unit_t) 
        
        parking_fees.append((car_num, total_f))
    
    parking_fees.sort(key=lambda x: x[0])
    
    return list(map(lambda x: x[1], parking_fees))

def HHMM_to_minute(HHMM):
    H, M = map(int, HHMM.split(":"))
    return H * 60 + M
    
    
    
    
    