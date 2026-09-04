# @time 15
# @tags 구현

def num_to_pos(num):
    if num == 1:
        return [0, 0]
    elif num == 2:
        return [0, 1]
    elif num == 3:
        return [0, 2]
    elif num == 4:
        return [1, 0]
    elif num == 5:
        return [1, 1]
    elif num == 6:
        return [1, 2]
    elif num == 7:
        return [2, 0]
    elif num == 8:
        return [2, 1]
    elif num == 9:
        return [2, 2]
    else:
        return [3, 1]

def dist(p1, p2):
    return abs(p1[0] - p2[0]) + abs(p1[1] - p2[1])

def solution(numbers, hand):
    answer = ''
    
    pos_l = [3, 0]
    pos_r = [3, 2]
    
    for num in numbers:
        
        if num in [1, 4, 7]:
            answer += 'L'
            pos_l = num_to_pos(num)
        
        elif num in [3, 6, 9]:
            answer += 'R'
            pos_r = num_to_pos(num)
            
        else: # 2, 5, 8, 0
            pos_num = num_to_pos(num)
            
            d_l = dist(pos_l, pos_num) 
            d_r = dist(pos_r, pos_num) 
            
            if d_l < d_r:
                answer += "L"
                pos_l = pos_num
            elif d_r < d_l:
                answer += "R"
                pos_r = pos_num
            elif hand == "left":
                answer += "L"
                pos_l = pos_num
            else: 
                answer += "R"
                pos_r = pos_num
    
    return answer