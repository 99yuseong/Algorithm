// 가장 많이 재생된 노래 -> 장르별, 두 개씩 앨범 출시
// 고유번호로 구분
    // 많이 재생된 장르
    // 장르내에서 많이 재생된 노래
        // 재생 횟수가 같다면 고유번호 낮은거 먼저

// 앨범에 들어갈 순서대로 리턴


// 고유 번호는 index
// N : 1~1만 
// O(N^3)
// 장르는 100개 미만
// 곡이 하나라면 하나만 선택

// 1. 장르가 정렬된 상태여야함
// 2. 노래가 많이 재생순으로 정렬된 상태여야함. -> 2개 prefix
// 3. 노래가 재생순서 같다면 먼저 들어온 순(고유번호 - 인덱스 순)

// Dict[ 장르 : [ 노래 ] ]

// 1. 장르 개수 Dict - [장르 : 개수] 
// 2. 장르 정렬 Dict - [장르 : [ 많이 재생 ] ]

// genres[고유번호] = 장르
// plays[고유번호] = 플레이수

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var playsDict: [String: Int] = [:]
    var genreDict: [String: [(Int, Int)]] = [:]
    
    for i in 0..<genres.count {
        playsDict[genres[i], default: 0] += plays[i]
        genreDict[genres[i], default: []].append((i, plays[i]))
    }
    
    let sortedGenres = playsDict.sorted { $0.value > $1.value }.map { $0.key }
    
    var result: [Int] = []
    
    for genre in sortedGenres {
        let songs = genreDict[genre]!.sorted {
            if $0.1 == $1.1 { return $0.0 < $1.0 }  // 재생횟수 같으면 고유번호 낮은 순
            return $0.1 > $1.1
        }
        result.append(contentsOf: songs.prefix(2).map { $0.0 })
    }
    
    return result
}
