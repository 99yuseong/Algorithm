# 모음으로 만드는 길이 5 이하의 모든 단어
# 해당 단어는 몇번째 단어?

# 1~5개 단어
# 5P1 + 5P2 + 5P3 + 5P4 + 5P5 = 5 + 25 + 125 + 625 + 3125 > 대강 4000개

# 단어부터 만든다음 > 일치여부 확인해도 될 것 같은데

def solution(word):
    
    collection = []
    
    for i in range(1, 6):
        for w in permu(i):
            collection.append(w)
            
    collection.sort()
    
    for i in range(len(collection)):
        if collection[i] == word:
            return i+1


chars = ['A', 'E', 'I', 'O', 'U']

# 중복 순열
def permu(n):

    result = set()
    cur = ""
    
    def select(k):
        nonlocal cur
        
        if k == n:
            result.add(cur)
            return
        
        for w in chars:
            cur += w
            select(k+1)
            cur = cur[:-1]
            
    select(0)
    
    return result
    