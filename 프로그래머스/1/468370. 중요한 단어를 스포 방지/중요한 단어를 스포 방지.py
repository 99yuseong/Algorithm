# 스포방지 기능
# 왼쪽 - 오른쪽 순서로 스포 방지 구간

# 1. 단어는 공백으로 구분, 소문자와 숫자로만 구성
# 2. 인덱스 하나 이상이 포함되면 스포일러 방지
# 3. 스포 구간이랑 단어 구간은 걸쳐있을 수 있다.

# 4. 스포방지 구간 && 스포방지가 아닌 구간에 등장하면 안됨 && 스포 방지 단어와 중복되면 안됨 && 왼쪽부터 판단

# 일반 단어 A
# 스포 방지 단어 B
# 중요 단어 C

# C의 개수를 리턴하라


# m: 1~2만


# 1. 스포방지 단어와 인덱스를 구한다.

def solution(message, spoiler_ranges):
    
    spoiler_ranges = spoiler_ranges[::-1]
    m = len(message)
    
    A = []
    B = []
    
    cur_start = 0
    cur_word = ""
    cur_spoil = False
    
    for i in range(m):
        
        if spoiler_ranges and spoiler_ranges[-1][1] < i:
            spoiler_ranges.pop()
        
        if message[i] != " " and spoiler_ranges and spoiler_ranges[-1][0] <= i <= spoiler_ranges[-1][1]:
            cur_spoil = True
            
        
        if message[i] != " ":
            cur_word += message[i]
            
        if (i+1 < m and message[i+1] == " ") or i == m-1:
            if cur_spoil:
                B.append(cur_word)
            else:
                A.append(cur_word)
            cur_start = i
            cur_spoil = False
            cur_word = ""
            
    set_a = set(A)
    set_b = set()
    
    c = []
    
    for b in B:
        if b in set_a: continue
        if b in set_b: continue
        c.append(b)
        set_b.add(b)
        
    return len(c)