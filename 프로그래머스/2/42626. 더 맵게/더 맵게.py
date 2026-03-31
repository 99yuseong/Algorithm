# 스코빌 지수를 K 이상으로
# 가장 낮은 2개 섞음 > heap[0] + 2 * heap[1]

# 모든 음식을 K이상이 될때까지
# 섞는 최소 횟수

# n: 2~100만
# K: 10억
# 불가능한 경우 -1

# min heap
# n번 동안 logN으로 heap에 삽입

import heapq

def solution(scoville, K):
    
    heap = scoville # min heap
    heapq.heapify(heap) # O(N)
    
    cnt = 0
    
    while len(heap) >= 2 and heap[0] < K:
        a = heapq.heappop(heap)
        b = heapq.heappop(heap)
        heapq.heappush(heap, a + 2 * b)
        cnt += 1
    
    return -1 if heap[0] < K else cnt