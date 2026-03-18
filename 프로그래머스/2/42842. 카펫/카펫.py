# 브라운, 노랑의 개수알때> 가로 세로를 리턴
# 5000 * 200만
# a * b = brown + yellow

def solution(brown, yellow):
    
    w = 3
    h = 0
    
    while w <= brown + yellow / 3:
        
        h = (brown + yellow) // w
        
        if (w + h) * 2 - 4 == brown and w >= h:
            return [w, h]
        
        else:
            w += 1
        
    return []