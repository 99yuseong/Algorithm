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

# 1. INFO: > [0, 1]로 가공 - N * M
# 2. 

# combination > nCk


from itertools import combinations

def solution(INFO):
    
    N = len(INFO)
    M = len(INFO[0][1])
    
    max_songs = 0
    min_guitars = N
    
    I = []
    for info in INFO:
        play = []
        for p in info[1]:
            play.append(1 if p == "Y" else 0)
        I.append(play)
        
    # 1 ~ 10개 기타 선택
    for num_guitars in range(1, N+1):
        
        # NCk로 기타 조합 선택
        for combi in combinations([x for x in range(0, N)], num_guitars):

            songs = [0] * M
            
            for guitar in combi:
                for j in range(M):
                    if songs[j] == 0 and I[guitar][j] == 1:
                         songs[j] = 1

            play_songs = sum(songs)
            
            # 현재 기타 조합 combi, 
            # 연주할 수 있는 곡 수 play_songs
            if play_songs > max_songs:
                min_guitars = num_guitars
                max_songs = play_songs
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