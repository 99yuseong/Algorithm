import Foundation

// 달리기
// 등수대로 배열
// 위치를 바꾼다는 건가

// n: 5~5만
// 소문자 & 중복 없음
// m: 100만

// 100만 * 5만

// 딕셔너리로 -> key:idx 관리
// swap으로 하면 100만

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    var players = players
    var dict: [String: Int] = [:]
    
    for (idx, player) in players.enumerated() {
        dict[player] = idx
    }
    
    for call in callings {
        
        let p1 = call
        let idx1 = dict[p1]!
        
        let p2 = players[idx1-1]
        let idx2 = dict[p2]!
        
        players.swapAt(idx1, idx2)
        dict[p1] = idx2
        dict[p2] = idx1
        
    }
    
    return players
}