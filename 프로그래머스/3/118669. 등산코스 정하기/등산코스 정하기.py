# n개의 지점
# 1~n까지 번호

# 출입구 / 쉼터 / 산봉우리
# 양방향, 일정 시간 소요

# 쉼터 / 산봉우리 > 휴식 가능
# 휴식 없이 이동하는 시간 max = intensity

# 출입구 > 산봉우리 > 원래 출입구
# 출입구 처음/끝 1번씩 + 산봉우리 1번

# 최소 intensity

# 출입구에서 출발해서 산봉우리까지 가는데 > 어짜피 왔던길 돌아가면 됨

# return [summit, min_intensity] > 여러 개라면 summit이 가장 작은 경우

# n: 2~5만
# paths: 5만 ~ 20만개
    # [i, j, w]
# gates: 1~5만
# summits: 1~5만

# 결론적으로 이동 비용이 최소인 값을 갱신하면서 등산
    # 산봉우리 도달 > 후보에 추가

# 다익스트라 > 등산 > multi_source로 gates에서 시작
    # 특정 위치까지 갱신
    # if cur_intensity > intensity:
        # intensity = max(intensity, cur_intensity)
    
# O(ElogV) > O(20만 lg 5만)
    
import heapq    

def solution(n, paths, gates, summits):
    
    graph = {}
    for i, j, w in paths:
        graph.setdefault(i, []).append((j, w))
        graph.setdefault(j, []).append((i, w))
    
    INF = float('inf')
    
    pq = []
    intensities = [INF] * (n+1)
    
    summits = set(summits)
    candidates = []
    
    for gate in gates:
        heapq.heappush(pq, (0, gate))
        intensities[gate] = 0
        
    while pq:
        cur_intensity, cur_pos = heapq.heappop(pq)
        
        # 크면 다시 계산 필요 없음
        if intensities[cur_pos] < cur_intensity:
            continue
        
        # 산봉우리면 탐색 종료
        if cur_pos in summits:
            candidates.append([cur_pos, cur_intensity])
            continue
        
        for pos, intensity in graph.get(cur_pos, []):
            
            next_intensity = max(cur_intensity, intensity)
            
            if next_intensity < intensities[pos]:
                intensities[pos] = next_intensity
                heapq.heappush(pq, (next_intensity, pos))
    
    candidates.sort(key=lambda x: (x[1], x[0]))
    
    return candidates[0]