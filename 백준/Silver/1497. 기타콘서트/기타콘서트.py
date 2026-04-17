# 기타를 구입
# 하나의 기타로 모든 곡 연주 X
# 최대한 많은 곡을 연주
# 필요한 최소 기타의 개수

# > max_songs를 갱신하면서, min_guitars로 갱신

# N: 1~10개의 기타
# M: 2~50개의 곡

# 기타는 중복되지 않는다.
# 연주불가능시 -1을 출력

# 10개의 기타 중
    # 1개 > 2개 > 3개 > ... > 10개를 골랐을때 연주할 수 있는 곡 수를 갱신
    # 만약 연주 곡수가 0이다 ? -1

# 기타 이름 불필요 > 인덱스로 구분
# 50개 곡 * 10개 기타 > 500개 확인을 10번 > 5000회

# 풀이 1. Combination 활용
# 1. INFO -> [0, 1]로 가공 - O(500)
# 2. 1~k개를 선택할지 결정 - O(N * NCK * M)
    # combination으로 nCk 결정
        # nCk를 돌면서 M개의 연주 가능을 결정
    # 연주할 수 있는 곡수로 값을 갱신

# 풀이 2. 비트마스킹 사용
# 1. INFO -> int로 가공 - O(10)
# 2. 기타를 선택 조합 모든 경우 range(1 << N) O(2^N)
    #

# combination > nCk

from itertools import combinations

def solution(GUITAR_INFO):
    
    N = len(GUITAR_INFO)
    M = len(GUITAR_INFO[0][1])
    
    max_songs = 0
    min_guitars = N
    
    # O(500)
    I = []
    
    for guitar, play in GUITAR_INFO:
        mask = 0
        for i in range(M):
            if play[i] == "Y":
                mask |= (1 << i)
        I.append(mask)
        
    for play_mask in range(1 << N): # 0~N번째 기타 선택여부에 대해서 - O(2^N)
        
        song_mask = 0
        
        for i in range(N): # O(N)
            if play_mask & (1 << i):
                song_mask |= I[i] # i번째 기타가 연주할 수 있는 노래 추가
        
        # play_songs = bin(song_mask).bit_count()
        num_guitars = bin(play_mask).count('1')
        play_songs = bin(song_mask).count('1')
        
        if play_songs > max_songs:
            max_songs = play_songs
            min_guitars = num_guitars
        elif play_songs == max_songs and num_guitars < min_guitars:
            min_guitars = num_guitars
            
    return min_guitars if max_songs != 0 else -1

def main():
    N, M = map(int, input().split())
    INFO = []
    for _ in range(N):
        INFO.append(list(input().split()))
    print(solution(INFO))

if __name__ == "__main__":
    main()