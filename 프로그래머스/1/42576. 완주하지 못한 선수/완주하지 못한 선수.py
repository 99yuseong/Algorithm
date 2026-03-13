def solution(participant, completion):
    
    player = {}
    
    for c in completion:
        player[c] = player.get(c, 0) + 1    
        
    for p in participant:
        if p in player and player[p] > 0:
            player[p] -= 1
        else:
            return p

# 마라톤 선수
# 1명을 제외하고 완주
