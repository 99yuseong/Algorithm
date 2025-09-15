import Foundation


// 불량 사용자 - 목록
// 최소 1개 이상의 *로 가려서 전달
// 가능한 경우의 수를 리턴

// banned_id와 매칭되는 개수 카운트
// -> 누적 곱

// user_id: 1~8 유저, 중복 X, 소문자와 숫자로 구성
// banned_id: 1~8, 소문자, 숫자, *
// 중복 제재는 없다.

// 근데 제재가 1개로 특정된다면?
// f**** -> frodo일 수 없잖아.
// frod* -> frodo

// 단순 누적 곱을 하면 안된다는 얘기지
// *rodo, *rodo

// 1. 개수가 같은 경우
// 2. 일부 정보가 같은 경우

// 총 8개니까 -> 8개 각각에 해당되는 조건을 매핑하고 처리해줘야함.
// Set으로 처리 해야겠네

// 1. 매칭되는 경우 확인

func solution(_ user_id: [String], _ banned_id: [String]) -> Int {
    
    var allBannedSet = Set<Set<String>>()
    var curBannedSet = Set<String>()
    
    var isUserUsed = [Bool](repeating: false, count: user_id.count)
    
    func dfs(_ k: Int) {
        
        if k == banned_id.count {
            allBannedSet.insert(curBannedSet)
            return
        }
        
        for i in 0..<user_id.count {
            
            guard !isUserUsed[i] else { continue }
            
            if user_id[i].isMatched(with: banned_id[k]) {
                isUserUsed[i] = true
                curBannedSet.insert(user_id[i])
                dfs(k+1)
                curBannedSet.remove(user_id[i])
                isUserUsed[i] = false
            }
        }
    }
    
    dfs(0)
    
    return allBannedSet.count
}


extension String {
    func isMatched(with banned_id: String) -> Bool {
        
        guard self.count == banned_id.count else { return false }
        
        for (c1, c2) in zip(self, banned_id) {
            guard c2 != "*" else { continue }
            
            if c1 != c2 { return false }
        }
        
        return true
    }
}
