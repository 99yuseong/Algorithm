# N개의 기차, 20개의 일렬 좌석
# M개의 명령

# 10만 기차, 10만개 명령

def solution(N, CMD):
    
    train_bits = [0] * (N+1)
    MASK = (1 << 20) -1
    
    for cmd in CMD:
        if cmd[0] == 1:
            i, x = cmd[1], cmd[2]
            train_bits[i] |= (1 << x-1)
            
        elif cmd[0] == 2:
            i, x = cmd[1], cmd[2]
            train_bits[i] &= ~(1 << x-1)
            
        elif cmd[0] == 3:
            i = cmd[1]
            train_bits[i] = (train_bits[i] << 1) & MASK
            
        elif cmd[0] == 4:
            i = cmd[1]
            train_bits[i] = train_bits[i] >> 1
            
        else:
            continue
    
    return len(set(train_bits[1:]))

def main():
    N, M = map(int, input().split())
    CMD = []
    for _ in range(M):
        CMD.append(list(map(int, input().split())))
    print(solution(N, CMD))

if __name__ == '__main__':
    main()