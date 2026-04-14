def solution(A):
    N = len(A)
    M = len(A[0][1])

    guitars = []
    for guitar, songs in A:
        bit = 0
        for i in range(M):
            if songs[i] == 'Y':
                bit |= (1 << i)
        guitars.append(bit)

    max_song_cnt = 0
    min_guitar_cnt = float('inf')

    for mask in range(1 << N):
        song_mask = 0
        guitar_cnt = 0

        for i in range(N):
            if mask & (1 << i):
                song_mask |= guitars[i]
                guitar_cnt += 1

        song_cnt = bin(song_mask).count('1')

        if song_cnt > max_song_cnt:
            max_song_cnt = song_cnt
            min_guitar_cnt = guitar_cnt
        elif song_cnt == max_song_cnt:
            min_guitar_cnt = min(min_guitar_cnt, guitar_cnt)

    if max_song_cnt == 0:
        return -1

    return min_guitar_cnt


def main():
    N, M = map(int, input().split())
    A = []
    for _ in range(N):
        A.append(input().split())
    print(solution(A))


if __name__ == '__main__':
    main()