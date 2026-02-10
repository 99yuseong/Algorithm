import Foundation

// 1 ~ n 서로 다른 정수 5개 오름차순

// m번의 해독 시도 가능

// 몇 개가 비밀코드에 포함?

// intersection

// 가능한 정수 조합 개수

// n과 같거나 작은 자연수
// q의 질문에서
// ans의 갯수 대답

// 가능한 정수 조합의 개수를 리턴하라

// n: 10 ~ 30과 같거나 작은 수 5개
// q: 1 ~ 10개의 질문

// 비밀코드가 존재하지 않는 경우는 없다.

// 5C2 = 10 or 5C3 = 10
// 최대 경우의 수는 10 ^ 5 = 10만개

// 보통은 경우의 수에서 제거하는 게 맞는 데.
// 아니면은 30C5 = 14만개 경우의 수 > loop로 돌면서 체크 cnt ++

// 1. 1~n까지 5개 선택 조합
// 2. loop 돌면서 q확인 충분

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    
    var cnt = 0

    out: for combi in combi(n) { // 14만 * 10개 * 5길이
        for i in 0..<q.count {
            if ans[i] == combi.filter { q[i].contains($0) }.count { continue }
            continue out
        }
        cnt += 1
    }
    
    return cnt
}

func combi(_ n: Int) -> [[Int]] {
    
    var result: [[Int]] = []
    var cur: [Int] = []
    
    func select(_ k: Int, _ s: Int) {
        
        if k == 5 {
            result.append(cur)
            return
        }
        
        for i in s..<n {
            cur.append(i+1)
            select(k+1, i+1)
            cur.removeLast()
        }
    }
    select(0, 0)
    
    return result
}