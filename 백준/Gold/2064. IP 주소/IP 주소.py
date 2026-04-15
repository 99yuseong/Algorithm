# 네트워크 컴퓨터 - IP 주소

# 컴퓨터 - IP 주소
# 여러 컴퓨터 - IP 네트워크 (네트워크 주소, 네트워크 마스크)

# IP 주소 8자리 이진수 

# IP 네트워크 > 2^m개의 컴퓨터에 할당

# 네트워크 주소 101 .. 000
# 네트워크마스크 111 .. 000

# n개의 IP 주소가 몇개까지 겹치나?

def int_to_ip(x):
    return ".".join(map(str, [
        (x >> 24) & 255,
        (x >> 16) & 255,
        (x >> 8) & 255,
        x & 255
    ]))

def ip_to_int(ip):
    a, b, c, d = ip
    return (a << 24) | (b << 16) | (c << 8) | d

def solution(IP):

    nums = [ip_to_int(ip) for ip in IP]
    
    mn = min(nums)
    mx = max(nums)
    
    diff = mn ^ mx # 서로 다른 비트 구간
    
    if diff == 0:
        mask = (1 << 32) - 1
    else:
        prefix_len = 32 - diff.bit_length()
        mask = ((1 << prefix_len) - 1) << (32 - prefix_len)

    network = mn & mask
    
    return [int_to_ip(network), int_to_ip(mask)]

def main():
    n = int(input())
    IP = []
    for _ in range(n):
        IP.append(list(map(int, input().split('.'))))

    network, mask = solution(IP)
    print(f"{network}\n{mask}")

if __name__ == '__main__':
    main()