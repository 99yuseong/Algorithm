# 유연 근무제
# 일주일 > 출근 희망시각

# 출근 희망시각 + 10분

# 주말 출근은 이벤트 영향 X
# 매일 1회

# 시 * 100 + 분

# 몇명이 상품을 받나?

# schedules: [출근 희망시각]
# timelogs: [실제 출근 시각]
# 이벤트 시작한 요일

# return 상품 받을 직원 수

# n: 1~1000개
# 희망 시각 : 700 ~ 1100사이값
# 출근 시각 : 600 ~ 2359

# 가능한 분만 주어진다.
# startday가 바뀐다 ?

# [1 ~ 7]
# 7로나눈 나머지 + 1

def time_to_min(time):
    return (time // 100) * 60 + (time % 100)

def is_time_in(time, hope):
    return time_to_min(time) <= time_to_min(hope) + 10

def solution(schedules, timelogs, startday):
    
    weekday_idx = []
    cur_idx = 0
    cur_day = startday
    
    while len(weekday_idx) != 5:
        if (cur_day-1) % 7 not in [5, 6]:
            weekday_idx.append(cur_idx)
        cur_idx += 1
        cur_day += 1
    
    n = len(schedules)
    
    win_empolyee = 0
    
    for i in range(n):
        hope = schedules[i]
        real = timelogs[i]
        
        can_get_gift = True
        for day_idx in weekday_idx:
             if not is_time_in(real[day_idx], hope):
                can_get_gift = False
                break
        
        if can_get_gift:
            win_empolyee += 1
        
    return win_empolyee