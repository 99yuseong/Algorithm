# @time 25
# @tags 구현

def clear(board):
    
    m = len(board)
    n = len(board[0])
    
    for j in range(n):
        
        items = []
        
        for i in range(m):
            if board[i][j] != "-":
                items.append(board[i][j])
                board[i][j] = "-"
                
        for i in range(m-1, -1, -1):
            if items:
                board[i][j] = items.pop()
            
            
def remove(i, j, board):
    
    removed = 0
    
    for x in [i, i+1]:
        for y in [j, j+1]:
            if board[x][y] != "-":
                board[x][y] = "-"
                removed += 1
    
    return removed

def is_boom(i, j, board):
    
    cur = board[i][j]
    
    if cur == "-":
        return False
    
    if cur != board[i+1][j]:
        return False
    
    if cur != board[i][j+1]:
        return False
    
    if cur != board[i+1][j+1]:
        return False
    
    return True
    
    
def solution(m, n, board):
    
    board = list(map(lambda x: list(x), board))
    
    removed = 0
    
    while True:
        
        # 1. 모든 점의 터짐 여부를 체크한다.
        booms = []
        
        for i in range(m-1):
            for j in range(n-1):
                if is_boom(i, j, board):
                    booms.append([i,j])
        
        if booms:
            # 2. 터진 점의 4개 블럭을 실제 카운트하며 제거한다. 이미 제거되었으면 넘어간다.
            for boom in booms:
                removed += remove(boom[0], boom[1], board)
                
            # 3. 떨어짐을 처리한다.
            clear(board)
            
        else:     
            break
    
    return removed