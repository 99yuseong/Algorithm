def is_win(board, mark):
    
    for i in range(3):
        if len(set(board[i])) == 1 and board[i][0] == mark:
            return True
    
    for j in range(3):
        ver_win = True
        for i in range(3):
            if board[i][j] != mark:
                ver_win = False
        if ver_win:
            return True
    
    
    if board[0][0] == mark and board[1][1] == mark and board[2][2] == mark:
        return True
    
    if board[0][2] == mark and board[1][1] == mark and board[2][0] == mark:
        return True
    
    return False

def solution(board):
    
    cnt_O = 0
    cnt_X = 0
    
    for i in range(3):
        for j in range(3):
            if board[i][j] == "O": 
                cnt_O += 1
            elif board[i][j] == "X": 
                cnt_X += 1
            
    if not (cnt_X + 1 == cnt_O or cnt_X == cnt_O):
        return 0
            
    is_win_O = is_win(board, "O")
    is_win_X = is_win(board, "X")
    
    
    if is_win_O and is_win_X:
        return 0
    
    if is_win_O and cnt_X + 1 != cnt_O:
        return 0

    if is_win_X and cnt_X != cnt_O:
        return 0
        
    return 1