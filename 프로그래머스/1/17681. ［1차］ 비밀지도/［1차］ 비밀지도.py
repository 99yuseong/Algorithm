def solution(n, arr1, arr2):
    
    map = []
    
    for i in range(n):
        map.append(arr1[i] | arr2[i])
    
    answer = []
    
    for mask in map:
        cur = ""
        for i in range(n):
            if mask & (1 << i):
                cur += "#"
            else:
                cur += " "
        answer.append(cur[::-1])
    
    return answer