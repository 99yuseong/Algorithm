from collections import deque
import sys

while True:
    rec = list(map(int, sys.stdin.readline().split()))
    N = rec.pop(0)

    if N == 0:
        break

    stack = deque()
    answer = 0

    for i in range(N):
        while len(stack) != 0 and rec[stack[-1]] > rec[i]:
            tmp = stack.pop()

            if len(stack) == 0:
                width = i
            else:
                width = i - stack[-1] - 1
            answer = max(answer, width * rec[tmp])
        stack.append(i)

    while len(stack) != 0:
        tmp = stack.pop()

        if len(stack) == 0:
            width = N
        else:
            width = N - stack[-1] - 1
        answer = max(answer, width * rec[tmp])

    print(answer)