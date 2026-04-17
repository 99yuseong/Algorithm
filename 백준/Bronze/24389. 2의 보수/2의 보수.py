# 2의 보수
# 모든 비트를 반전 + 1

# N: 1~10억

def solution(N):
    N_tc = ((~N) + 1) & ((1 << 32) - 1)
    return bin(N ^ N_tc).count('1')
    

def main():
    N = int(input())
    print(solution(N))

if __name__ == '__main__':
    main()