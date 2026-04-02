# 하드디스크 한번에 하나의 작업만
# 우선순위 디스크 컨트롤러

# 디스크 컨트롤러 (작업번호, 요청시각, 소요시간)
# 하드디스크 - 작업X, 대기큐O > 작업
# wk_time 짧을 수록, rq_time이 빠를 수록, wk_id가 작을수록 빠르게

# 한번에 1개의 작업만 가능

# 반환 시간 > 종료 - 요청시간

# 매초 확인해야함
# jobs는 최대 500개
# 500개 * 1000초 = 약 50만초 + 1000

import heapq

def solution(jobs):
    
    # 반환시간
    n = len(jobs)
    rt_time = []
    
    jobs.sort(key=lambda x: x[0])
    
    # 매초 확인
    t = 0
    cur_wk_idx = 0
    disk = [] # (fn_time, rq_time)
    controller = [] # (wk_time, rq_time)
    
    while len(rt_time) < n:
        
        while cur_wk_idx < n and jobs[cur_wk_idx][0] == t:
            rq_time, wk_time = jobs[cur_wk_idx]
            heapq.heappush(controller, (wk_time, rq_time, cur_wk_idx))
            cur_wk_idx += 1
            
        if len(disk) == 0 or disk[-1][0] == t:
            
            if len(disk) > 0: 
                disk.pop()
            
            if controller:
                wk_time, rq_time, _ = heapq.heappop(controller)
                disk.append((t+wk_time, rq_time))
                rt_time.append(t+wk_time-rq_time)
        
        t += 1
        
    return sum(rt_time) // len(rt_time)