# 장르별 가장 많이 재생된 노래 2개씩

# 1. 노래 많은 장르 순
# 2. 많이 재생된 노래 순
# 3. 고유번호가 낮은 순

# 장르와 재생횟수 > 

# 노래를 고유번호순으로 리턴 > 인덱스를 리턴하라는 것

# 장르별 노래 카운트
# 장르 : [인덱스]

def solution(genres, plays):
    
    n = len(genres)
    d = {}
    total_plays = {}
    answer = []
    
    # 장르 분리
    for i in range(n):
        d[genres[i]] = d.get(genres[i], [])
        d[genres[i]].append(i)
        total_plays[genres[i]] = total_plays.get(genres[i], 0) + plays[i]
    
    # 장르별 재생이 많은 순 정렬
    for genre in sorted(total_plays.keys(), key=lambda x: -total_plays[x]):
        # 많이 재생된 순, 고유번호 낮은 순
        songs = sorted(d[genre], key=lambda x: (-plays[x], x))
        # 2곡씩 선택
        answer += songs[:2]
    
    return answer
