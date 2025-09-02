// 도난

// 번호
// 앞 아니면 뒤만 빌려줄 수 있음

// 전체 n명
// 도난 lost 리스트
// 여벌 reserve 리스트

// 최대 학생수 return

// n: 2~30
// lost: 1~n 중복 x
// reserve: 1~n 중복 x
// 여벌이 도난이면 빌려줄 수 없음

// lostSet, reserveSet -> contain여부로 확인
// 1. 본인 도난 체크
// 2. 본인 여벌 체크
// 3. 주변 필요 체크

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var stu = 0
    var lostSet = Set(lost)
    var reserveSet = Set(reserve)
    
    for i in (1...n) {
        
        let isLost = lostSet.contains(i)
        let hasReserve = reserveSet.contains(i)
        
        if isLost {
            // 도난 O
            
            if hasReserve { 
                // 여분 O
                reserveSet.remove(i) 
                stu += 1
                
            } else {
                
                // 여분 X
                let hasFront = reserveSet.contains(i-1) && !lostSet.contains(i-1)
                let hasBack = reserveSet.contains(i+1) && !lostSet.contains(i+1)
                
                if hasFront {
                    reserveSet.remove(i-1) 
                    stu += 1
                } else if hasBack {
                    reserveSet.remove(i+1) 
                    stu += 1
                }
            }
            
        } else {
            // 도난 X
            stu += 1
        }
    }
    
    return stu
}
