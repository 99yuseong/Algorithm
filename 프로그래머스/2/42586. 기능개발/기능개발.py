def solution(progresses, speeds):
    
    n = len(progresses)
    
    answer = []
    pop_idx = 0
    
    while True:
        if pop_idx == n: break
        
        # 미완료 작업 진도 수행
        for i in range(pop_idx, n):
            progresses[i] += speeds[i]
        
        # 완료 작업 수 카운트
        finish = 0
        while pop_idx < n and progresses[pop_idx] >= 100:
            pop_idx += 1
            finish += 1
        
        # 완료 작업 존재 시 카운트를 배열에 추가 
        if finish > 0:
            answer.append(finish)
    
    return answer