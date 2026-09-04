# @time 9

import heapq
    
def solution(scoville, K):
    
    heap = []
    mixed = 0
    
    for scv in scoville:
        heapq.heappush(heap, scv)
        
    while len(heap) > 1:
        
        if heap[0] >= K:
            return mixed
    
        f1 = heapq.heappop(heap)
        f2 = heapq.heappop(heap)
        
        heapq.heappush(heap, f1 + f2 * 2)
        mixed += 1
        
    return -1 if heap[0] < K else mixed