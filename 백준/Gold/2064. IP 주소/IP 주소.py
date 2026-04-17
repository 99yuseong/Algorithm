# 컴퓨터 - IP 주소
# 여러 컴퓨터 - IP network - (네트워크 주소, 네트워크 마스크)

# IP 주소 0.0.0.0 ~ 255.255.255.255

# IP 주소들이 주어졌을때, 네트워크 주소와 마스크를 구해라
# 가장 크기가 작은 M이 최소인 네트워크를 구하도록 한다.

# 1천개의 주소

# 네트워크 주소는 > IP 주소가 공통으로 일치하는 비트
# IP를 모두 & 연산하면 공통만 남는다 이얘기 아닌가

# 마스크는 해당 연산한 구간에서 윗 부분을 모두 1로 변환

# 주소 int로 변환
# int를 주소로 변환도 

def ad_to_int(ip):
    num = 0
    ips = list(map(int, ip.split('.')))
    return ips[0] * (1 << 24) + ips[1] * (1 << 16) + ips[2] * (1 << 8) + ips[3]

def int_to_ad(num):
    ad = []
    mv = 24
    while mv >= 0:
        ad.append(num // (1 << mv))
        num %= (1 << mv)
        mv -= 8
    return ".".join(list(map(str, ad)))
        
def solution(IP):
    IP = [ad_to_int(x) for x in IP]
    
    min_ad = min(IP)
    max_ad = max(IP)
    
    diff = min_ad ^ max_ad
    prefix_len = 32 - diff.bit_length()
    
    nw_mk = ((1 << prefix_len) - 1) << diff.bit_length()
    nw_ad = nw_mk & min_ad
    
    return (int_to_ad(nw_ad), int_to_ad(nw_mk))

def main():
    n = int(input())
    IP = []
    for _ in range(n):
        IP.append(input())
    
    nw_ad, nw_mk = solution(IP)
    print(nw_ad)
    print(nw_mk)

if __name__ == '__main__':
    main()