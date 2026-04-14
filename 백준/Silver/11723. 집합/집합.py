import sys
input = sys.stdin.readline
write = sys.stdout.write

def solution():
    M = int(input())
    t = 0

    for _ in range(M):
        cmd = input().split()
        op = cmd[0]

        if op == "add":
            x = int(cmd[1])
            t |= (1 << x)

        elif op == "remove":
            x = int(cmd[1])
            t &= ~(1 << x)

        elif op == "check":
            x = int(cmd[1])
            write("1\n" if (t & (1 << x)) else "0\n")

        elif op == "toggle":
            x = int(cmd[1])
            t ^= (1 << x)

        elif op == "all":
            t = (1 << 21) - 2

        elif op == "empty":
            t = 0

if __name__ == '__main__':
    solution()