# N개의 기차
# 20개의 좌석

# M개의 명령이 주어진다.

# 명령 수행 후
# 은하수를 건널 수 있는 기차의 수 = 손님 배열의 유일한 개수

# 기차의 수 N대 : 1~10만
# 명령의 수 M개 : 1~10만

# 0. 10만개의 bit_mask 배열을 생성
# 1. M번의 명령 수행
    # 좌석 업데이트 > 1, 0으로 탑승 여부 변경
    # 모두 한칸씩 뒤로, 한칸씩 앞으로 > shift 연산이 필요하다.
    # 비트마스킹으로 처리하고, 각 기차의 상태를 bit_mask로 저장
# 2. 유일한 bit_mask의 개수를 리턴

def solution(N, CMD):
    
    trains = [0] * N # bit_mask 배열 생성
    
    for cmd in CMD:
        if cmd[0] == 1:
            i, x = cmd[1], cmd[2] 
            trains[i-1] |= (1 << (x-1))
            
        elif cmd[0] == 2:
            i, x = cmd[1], cmd[2] 
            trains[i-1] &= ~(1 << (x-1))
            
        elif cmd[0] == 3:
            i = cmd[1]
            trains[i-1] = (trains[i-1] << 1) & ((1 << 20) - 1)
            
        elif cmd[0] == 4:
            i = cmd[1]
            trains[i-1] = (trains[i-1] >> 1)
            
        else:
            continue
    
    return len(set(trains))

def main():
    N, M = map(int, input().split())
    CMD = []
    for _ in range(M):
        CMD.append(list(map(int, input().split())))
    print(solution(N, CMD))

if __name__ == '__main__':
    main()