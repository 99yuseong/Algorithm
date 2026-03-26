# 자르고 정렬했을때 K번쨰 수
# 100개 배열, 50번의 연산
# 

def solution(array, commands):
    answer = []
    for i, j, k in commands:
        part = sorted(array[i-1:j])
        answer.append(part[k-1])
    return answer