def solution(num_list):
    
    multiply = 1
    for n in num_list:
        multiply *= n
        
    s = sum(num_list)
    return 1 if multiply < s * s else 0