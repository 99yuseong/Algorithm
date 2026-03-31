# 하드디스크는 한 번에 하나의 작업만

# 우선순위 디스크 컨트롤러
# 작업 요청 > 번호, 요청시각, 소요시간 대기큐

# 우선 순위 1. 소요시간이 짧을 수록 2. 요청 시각이 빠를 수록 3. 번호가 작을 수록


# 1. 작업 종료 확인
# 2. 작업 요청 확인
# 3. 대기큐 추가
# 4. (작업중) continue
# 5. (작업완료) 대기큐 확인 > 우선순위 높은 것 시작

# 평균 반환 시간의 정수부분을 리턴

# jobs: 500
# 1000초 > 최대 50만초


# O(t + NlogN)
# loop t를 카운트 
    # 작업 요청 확인 > 대기큐 추가
    # 작업 종료 확인 > (작업완료시) 우선순위 높은 것부터 시작

import heapq

def solution(jobs):
    
    n = len(jobs)
    
    # jobs[i] = [request_time, work_time]
    # 번호는 정렬 전 인덱스로 관리
    indexed_jobs = [(rq, wt, i) for i, (rq, wt) in enumerate(jobs)]
    indexed_jobs.sort(key=lambda x: x[0])  # 요청 시각 순
    
    heap = []
    time = 0
    i = 0
    total_rt = 0
    
    while i < n or heap:
        # 현재 시각까지 들어온 작업 전부 대기큐에 넣기
        while i < n and indexed_jobs[i][0] <= time:
            rq, wt, idx = indexed_jobs[i]
            # 우선순위: 소요시간, 요청시각, 번호
            heapq.heappush(heap, (wt, rq, idx))
            i += 1
        
        if heap:
            wt, rq, idx = heapq.heappop(heap)
            time += wt
            total_rt += time - rq
        else:
            # 대기 작업이 없으면 다음 요청 시각으로 점프
            time = indexed_jobs[i][0]
    
    return total_rt // n