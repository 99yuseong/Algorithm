# @time 19
# @tags Heap

import heapq
from collections import defaultdict

def solution(operations):
    
    d = defaultdict(int)
    
    min_heap = []
    max_heap = []
    
    for op in operations:
        o, n = op.split()
        
        if o == "I":
            heapq.heappush(min_heap, int(n))
            heapq.heappush(max_heap, -int(n))
            d[int(n)] += 1
        
        elif int(n) == 1:
            
            # 최댓힙 정리
            while max_heap and d[-max_heap[0]] == 0:
                heapq.heappop(max_heap)
            
            if max_heap and d[-max_heap[0]] > 0:
                d[-max_heap[0]] -= 1
                heapq.heappop(max_heap)
        
        else:
            # 최솟값 제거
            while min_heap and d[min_heap[0]] == 0:
                heapq.heappop(min_heap)
            
            if min_heap and d[min_heap[0]] > 0:
                d[min_heap[0]] -= 1
                heapq.heappop(min_heap)
    
    left = 0
    
    for k in d:
        if d[k] > 0:
            left += 1
    
    if left == 0:
        return [0,0]
    
    else:
        while min_heap and d[min_heap[0]] == 0:
            heapq.heappop(min_heap)
        while max_heap and d[-max_heap[0]] == 0:
            heapq.heappop(max_heap)
    
        return [-max_heap[0], min_heap[0]]