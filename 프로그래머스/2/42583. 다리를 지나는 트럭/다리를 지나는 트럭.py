from collections import deque

def solution(bridge_length, weight, truck_weights):
    
    queue = deque() # [weight, out_t]
    
    n = len(truck_weights)
    cur_idx = 0
    cur_weight = 0
    finish = 0
    t = 0
    
    while True:
        
        if len(queue) > 0 and t >= queue[0][1]:
            truck = queue.popleft()
            cur_weight -= truck[0]
            finish += 1
            
        if finish == n:
            break
            
        if cur_idx < n and len(queue) <= bridge_length and cur_weight + truck_weights[cur_idx] <= weight:
            queue.append([truck_weights[cur_idx], t+bridge_length])
            cur_weight += truck_weights[cur_idx]
            cur_idx += 1
        
        t += 1
    
    return t+1