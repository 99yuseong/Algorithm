# 이중 우선순위 큐
# 모든 연산 후 큐가 비어있으면 [0,0] 아니면 [최대, 최소]

# 100만 cmd
# 빈큐 삭제 명령은 무시

# 최대힙, 최소힙 따로?
# 숫자는 중복될 수 있다. 빠짐 체크가 애매하긴함. > id를 사용하자

import heapq

def solution(operations):
    
    min_heap = []
    max_heap = []
    removed_set = set()
    
    item_id = 1
    for op in operations:
        cmd, num = op.split()
        num = int(num)
        
        if cmd == 'I': # 큐에 추가
            heapq.heappush(min_heap, (num, item_id))
            heapq.heappush(max_heap, (-num, item_id))
            item_id += 1
        
        elif num == 1: # 최댓값 삭제
            while max_heap and max_heap[0][1] in removed_set:
                heapq.heappop(max_heap)
            if max_heap:
                removed_set.add(heapq.heappop(max_heap)[1])
        
        else: # 최솟값 삭제
            while min_heap and min_heap[0][1] in removed_set:
                heapq.heappop(min_heap)
            if min_heap:
                removed_set.add(heapq.heappop(min_heap)[1])
        
    
    while max_heap and max_heap[0][1] in removed_set:
        heapq.heappop(max_heap)
    
    while min_heap and min_heap[0][1] in removed_set:
        heapq.heappop(min_heap)
    
    return [-max_heap[0][0], min_heap[0][0]] if min_heap and max_heap else [0,0]