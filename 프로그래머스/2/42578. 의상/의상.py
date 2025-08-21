def solution(clothes):
    
    cloth_dict = {}
    
    for name, kind in clothes:
        if kind in cloth_dict:
            cloth_dict[kind] += 1
        else:
            cloth_dict[kind] = 1
    
    answer = 1
    
    for value in cloth_dict.values():
        answer *= value + 1
    
    return answer - 1

# Dictionary에 담고, 