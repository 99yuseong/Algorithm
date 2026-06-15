def jadencase(str):
    if str == "":
        return ""
    return str[0].upper() + str[1:].lower()

def solution(s):
    words = list(map(jadencase, s.split(" ")))
    
    return " ".join(words)