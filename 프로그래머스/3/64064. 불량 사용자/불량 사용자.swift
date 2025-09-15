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
    
    var bannedSet = Set<Set<String>>()
    var currentBanned = Set<String>()
    var usedUsers = [Bool](repeating: false, count: user_id.count)
    
    func dfs(_ bannedIndex: Int) {
        // 모든 banned_id를 처리했다면 현재 조합을 저장
        if bannedIndex == banned_id.count {
            bannedSet.insert(currentBanned)
            return
        }
        
        // 현재 banned_id와 매칭 가능한 user_id들을 찾아서 시도
        for userIndex in 0..<user_id.count {
            // 이미 사용된 사용자는 건너뛰기
            guard !usedUsers[userIndex] else { continue }
            
            // 현재 사용자가 현재 banned_id와 매칭되는지 확인
            if user_id[userIndex].isMatched(with: banned_id[bannedIndex]) {
                // 백트래킹: 선택하고 재귀 호출 후 원복
                usedUsers[userIndex] = true
                currentBanned.insert(user_id[userIndex])
                
                dfs(bannedIndex + 1)
                
                currentBanned.remove(user_id[userIndex])
                usedUsers[userIndex] = false
            }
        }
    }
    
    dfs(0)
    return bannedSet.count
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
