# @time 25

def deliver(deliveries, k):
        
    while deliveries and k > 0:
        if deliveries[-1] > 0:
            if deliveries[-1] > k:
                deliveries[-1] -= k
                k = 0
            else:
                k -= deliveries[-1]
                deliveries.pop()
        else:
            deliveries.pop()
            
    while deliveries and deliveries[-1] == 0:
        deliveries.pop()
            
def pickup(pickups, k):
    
    while pickups and k > 0:
        if pickups[-1] > 0:
            if pickups[-1] > k:
                pickups[-1] -= k
                k = 0
            else:
                k -= pickups[-1]
                pickups.pop()
        else:
            pickups.pop()
            
    while pickups and pickups[-1] == 0:
        pickups.pop()

def solution(cap, n, deliveries, pickups):
    
    answer = 0
    
    while deliveries and deliveries[-1] == 0:
        deliveries.pop()
    
    while pickups and pickups[-1] == 0:
        pickups.pop()
    
    answer = max(len(deliveries), len(pickups)) * 2
    
    while deliveries or pickups:
        deliver(deliveries, cap)
        pickup(pickups, cap)
        
        answer += max(len(deliveries), len(pickups)) * 2
        
        
        
    return answer