# O(NlgN)안으로
# 이분탐색? -> 정렬 후, N개 배열을 돌면서 이분탐색으로 접두사 여부 확인
    # 1. 배열 정렬
    # 2. for문을 돌면서:
        # target의 길이만큼 mid를 자르고
        # 크기 비교 후 이분탐색
        
def solution(phone_book):
    phone_dict = {}
    
    for phone in phone_book:
        phone_dict[phone] = 1
    
    for phone in phone_book:
        temp = ""
        for i in range(len(phone)):
            temp += phone[i]
            
            if temp in phone_dict and temp != phone:
                return False
            
    return True
        
# def solution(phone_book):
    
#     n = len(phone_book)    
#     sorted_phone_book = sorted(phone_book)
        
#     for i in range(n):
        
#         l = i
#         r = n - 1
        
#         while l <= r:
            
#             m = (l + r) // 2
            
#             if idx != m and sorted_phone_book[m].startswith(sorted_phone_book[idx]): 
#                 return False
            
#             if sorted_phone_book[m] < sorted_phone_book[idx]:
#                 l = m + 1
#             else:
#                 r = m - 1
    
#     return answer

# 전화번호 중 다른 번호의 접두어가 있는지?

# 전화번호 배열 -> 접두사인 경우가 있으면 false / 있으면 true

# 배열 1~100만
# 각 아이템 길이는 1~20
# 중복은 없음

# 119 (접두사)

# 숫자 개념



# 해시 -> 뭐로 시작하는 수 - 해시개념인가?
