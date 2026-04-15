# 뺄셈 > 2의 보수
# 비트 반전 + 1

def solution(N):
    twos = (~N + 1) & ((1 << 32) - 1)
    return bin((N ^ twos) & ((1 << 32) - 1)).count('1')

def main():
    N = int(input())
    print(solution(N))

if __name__ == '__main__':
    main()