# def solution(numbers):
#     answer = 0
#     for i in numbers:
#         for j in numbers:
#             if i == j: continue
#             answer = max(answer, i*j)
#     return answer

def solution(numbers):
    numbers.sort()
    return numbers[-1] * numbers[-2]