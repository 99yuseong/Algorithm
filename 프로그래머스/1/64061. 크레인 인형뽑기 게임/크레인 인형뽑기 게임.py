# @time 15
# @tags 구현

def solution(board, moves):
    
    k = len(board)
    
    stack = []
    removed = 0
    
    for move in moves:
        
        # 1. board[k][move-1] 가장 위를 찾아 stack에 넣는다. 30
        
        exists = False
        
        for i in range(k):
            
            if board[i][move-1] > 0:
                
                # 집는다.
                item = board[i][move-1]
                board[i][move-1] = 0
                
                # 2. stack 터짐을 갱신한다.
                
                if stack and stack[-1] == item:
                    removed += 2
                    stack.pop() # 제거
                else:
                    stack.append(item) # 추가
                
                exists = True
                break
                
        # 없으면 무시한다.
        
        # 3. board[k][move-1]을 재정렬한다. 30
        
        if exists:
            dolls = []
            
            for i in range(k):
                if board[i][move-1] > 0:
                    dolls.append(board[i][move-1])
                    board[i][move-1] = 0
            
            for i in range(k-1, -1, -1):
                if dolls:
                    board[i][move-1] = dolls.pop()
                else:
                    break
                    
    return removed