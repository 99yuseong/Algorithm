# @time 5
# @tags Stack

def solution(cards1, cards2, goal):
    
    # stack으로 전환
    cards1.reverse()
    cards2.reverse()
    
    for word in goal:
        
        if cards1 and cards1[-1] == word:
            cards1.pop()
        elif cards2 and cards2[-1] == word:
            cards2.pop()
        else:
            return "No"
    
    return "Yes"