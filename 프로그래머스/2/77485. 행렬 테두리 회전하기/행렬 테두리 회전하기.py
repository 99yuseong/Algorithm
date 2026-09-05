# @time 15
# @tags 구현

def rotate(box, x1, y1, x2, y2):
    
    start = box[x1][y1]
    min_num = start
    
    for i in range(x1, x2):
        box[i][y1] = box[i+1][y1]
        min_num = min(min_num, box[i+1][y1])
        
    for j in range(y1, y2):
        box[x2][j] = box[x2][j+1]
        min_num = min(min_num, box[x2][j+1])
    
    for i in range(x2, x1, -1):
        box[i][y2] = box[i-1][y2]
        min_num = min(min_num, box[i-1][y2])
        
    for j in range(y2, y1, -1):
        box[x1][j] = box[x1][j-1]
        min_num = min(min_num, box[x1][j-1])
        
    box[x1][y1+1] = start
    
    
    return min_num

def solution(rows, columns, queries):
    
    box = [[0] * columns for _ in range(rows)]
    
    n = 1
    
    for i in range(rows):
        for j in range(columns):
            box[i][j] = n
            n += 1
            
    answer = []
    
    for query in queries:
        
        x1, y1, x2, y2 = query
        
        min_num = rotate(box, x1-1, y1-1, x2-1, y2-1)
    
        answer.append(min_num)
    
    return answer