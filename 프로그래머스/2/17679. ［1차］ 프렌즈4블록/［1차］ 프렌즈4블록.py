
# 최대 900칸

def solution(m, n, board):
    
    def is_4_block(x, y):
        nonlocal m, n, board
        
        if x < 0 or x >= m-1 or y < 0 or y >= n-1:
            return False
        
        return True if len(set([
            board[x][y], 
            board[x+1][y], 
            board[x][y+1], 
            board[x+1][y+1]
        ])) == 1 and board[x][y] != "-" else False
        
    def erase(x, y):
        nonlocal board
        board[x][y] = "-"
        board[x+1][y] = "-" 
        board[x][y+1] = "-"
        board[x+1][y+1] = "-"
    
    def drop():
        
        nonlocal m, n, board
        
        for j in range(n):
            
            vertical = []
            
            for i in range(m):
                if board[i][j] != "-":
                    vertical.append(board[i][j])
                    board[i][j] = "-"
            
            vertical = ["-"] * (m - len(vertical)) + vertical
            
            for i in range(m):
                board[i][j] = vertical[i]
    
    new_board = []
    for row in board:
        new_board.append(list(row))
    board = new_board
        
    while True:
        
        erase_target = []

        for i in range(m-1):
            for j in range(n-1):
                if is_4_block(i, j):
                    erase_target.append((i, j))
        
        if len(erase_target) == 0:
            break
            
        for (i, j) in erase_target:
            erase(i, j)
        
        drop()     
        
    
    count = 0
    for i in range(m):
        for j in range(n):
            if board[i][j] == "-":
                count += 1
    
    return count