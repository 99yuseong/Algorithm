import sys
input = sys.stdin.readline
write = sys.stdout.write

def solution(M):
    
    answer = ""
    mask_s = 0
    
    # 300백만개의 연산
    for _ in range(M):
        cmd = input().split()
        
        if cmd[0] == 'add':
            x = int(cmd[1])
            mask_s |= (1 << x)

        elif cmd[0] == 'remove':
            x = int(cmd[1])
            mask_s &= ~(1 << x)
        
        elif cmd[0] == 'check':
            x = int(cmd[1])
            if mask_s & (1 << x):
                write("1\n")
            else:
                write("0\n")

        elif cmd[0] == 'toggle':
            x = int(cmd[1])
            mask_s ^= (1 << x)
        
        elif cmd[0] == 'all':
            mask_s = (1 << 21) - 2
        
        elif cmd[0] == 'empty':
            mask_s = 0
    
    print(answer)
    

def main():
    M = int(input())
    solution(M)
        
if __name__ == "__main__":
    main()