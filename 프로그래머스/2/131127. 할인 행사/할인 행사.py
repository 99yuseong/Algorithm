def solution(want, number, discount):
    
    want_dict = {}
    discount_dict = {}
    
    for i in range(len(want)):
        want_dict[want[i]] = number[i]
    
    for i in range(10):
        discount_dict.setdefault(discount[i], 0)
        discount_dict[discount[i]] += 1
    
    cnt = 1 if want_dict == discount_dict else 0
    
    for i in range(10, len(discount)):
        
        if discount_dict[discount[i-10]] == 1:
            discount_dict.pop(discount[i-10])
        else:
            discount_dict.setdefault(discount[i-10], 0)
            discount_dict[discount[i-10]] -= 1
            
        discount_dict.setdefault(discount[i], 0)
        discount_dict[discount[i]] += 1
        
        if want_dict == discount_dict:
            cnt += 1
        
    return cnt