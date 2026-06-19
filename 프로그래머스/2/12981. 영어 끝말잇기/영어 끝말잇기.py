def solution(n, words):
    
    word_set = set()
    last_word = ""
    
    for i in range(len(words)):
        
        num = (i % n) + 1
        word = words[i]
        order = int(i/n) + 1
        
        if word in word_set:
            return [num, order]
        
        if last_word and last_word[-1] != word[0]:
            return [num, order]
        
        last_word = word
        word_set.add(word)
        
    return [0, 0]