# 접두어
# 1개라도 존재하면 리턴

# 1~100만개의 번호
# 20자리

# 그리디
# 정렬 > 앞뒤 확인

def solution(phone_book):
    
    phone_book.sort()
    
    for i in range(len(phone_book)):
        
        p = phone_book[i]
        
        if i > 0 and len(p) <= len(phone_book[i-1]) and phone_book[i-1][:len(p)] == phone_book[i]:
            return False
        
        if i+1 < len(phone_book) and len(p) <= len(phone_book[i+1]) and phone_book[i+1][:len(p)] == phone_book[i]:
            return False
        
    return True