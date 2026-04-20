# 자카드 유사도
# 두 집합의 교집합 크기 / 합집합 크기
# 모두 공집합일 경우 > 1

# [1, 1, 1] [1, 1, 1, 1, 1]

# 문자열 2~1000자리
# 두글자씩 다중 집합 원소로
# 만약 공백 / 숫자 / 특수 문자라면 글자 버리기
# lower로 처리

# 문자열 1000자리
    # 999개의 원소 2 덩어리
    
    # 배열 2개 처리 > O(2000)

def union(A, B):
    
    U = []
    
    while A and B:
        if A[-1] < B[-1]:
            U.append(B.pop())
        elif A[-1] > B[-1]:
            U.append(A.pop())
        else:
            B.pop()
            U.append(A.pop())
    
    # 둘다 비거나, 한쪽만 안 비거나
    return U + A + B
    
def intersect(A, B):
    
    I = []
    
    while A and B:
        
        if A[-1] < B[-1]:
            B.pop()
        
        elif A[-1] > B[-1]:
            A.pop()
        
        else:
            B.pop()
            I.append(A.pop())
    
    # 둘다 비거나, 한쪽만 안 비거나
    return I

def J(A, B): # [ab, bc, cd] / [ab, cs, sd]
    
    A.sort()
    B.sort()

    U = union(A[:], B[:])
    I = intersect(A[:], B[:])
    
    return len(I) / len(U) if U else 1

def isAlpabet(char):
    return 'a' <= char <= 'z' or 'A' <= char <= 'Z'

def solution(str1, str2):
    
    A = []
    B = []
    
    for i in range(1, len(str1)):
        if isAlpabet(str1[i-1]) and isAlpabet(str1[i]):
            A.append(f"{str1[i-1].lower()}{str1[i].lower()}")
    
    for i in range(1, len(str2)):
        if isAlpabet(str2[i-1]) and isAlpabet(str2[i]):
            B.append(f"{str2[i-1].lower()}{str2[i].lower()}")
    
    return int(J(A, B) * 65536)