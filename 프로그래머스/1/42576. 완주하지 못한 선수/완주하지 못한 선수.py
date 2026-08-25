def solution(participant, completion):
    
    participant.sort()
    completion.sort()
    
    while completion:
        if participant[-1] != completion[-1]:
            return participant[-1]
        
        participant.pop()
        completion.pop()
    
    return participant[-1]