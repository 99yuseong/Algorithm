# O(NlgN)안으로
# 이분탐색? -> 정렬 후, N개 배열을 돌면서 이분탐색으로 접두사 여부 확인
    # 1. 배열 정렬
    # 2. for문을 돌면서:
        # target의 길이만큼 mid를 자르고
        # 크기 비교 후 이분탐색

def solution(phone_book):
    
    answer = True
    
    sorted_phone_book = sorted(phone_book)
    
    for idx in range(len(sorted_phone_book)):
        
        l = idx
        r = len(sorted_phone_book) - 1
        
        while l <= r:
            m = (l + r) // 2
            
            if idx != m and sorted_phone_book[m].startswith(sorted_phone_book[idx]): 
                answer = False
                break
            
            if idx < m:
                r = m - 1
            else:
                l = m + 1
    
    return answer

# 전화번호 중 다른 번호의 접두어가 있는지?

# 전화번호 배열 -> 접두사인 경우가 있으면 false / 있으면 true

# 배열 1~100만
# 각 아이템 길이는 1~20
# 중복은 없음

# 119 (접두사)

# 숫자 개념



# 해시 -> 뭐로 시작하는 수 - 해시개념인가?
