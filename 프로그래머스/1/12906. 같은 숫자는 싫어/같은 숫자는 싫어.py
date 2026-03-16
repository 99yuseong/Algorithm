# 0~9로 구성된 원소
# 연속으로 나타난다면 제거 > 중복을 제거
# 배열 돌면서 신규 배열 생성. 마지막과 다르다면 append

# n: 100만


def solution(arr):
    answer = []
    for n in arr:
        if len(answer) > 0 and answer[-1] == n:
            continue
        answer.append(n)
    return answer