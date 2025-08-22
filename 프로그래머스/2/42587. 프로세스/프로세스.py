from collections import deque

def solution(priorities, location):

    dq = deque(priorities)
    target = location
    execute_order = 1
    
    while dq:
        cur_p = dq[0]
        
        if any(cur_p < x for x in list(dq)[1:]):
            dq.append(dq.popleft())
            if target == 0:
                target = len(dq) - 1
            else:
                target -= 1
        else:
            dq.popleft()
            if target == 0:
                return execute_order
            execute_order += 1
            target -= 1
    
    return execute_order
    