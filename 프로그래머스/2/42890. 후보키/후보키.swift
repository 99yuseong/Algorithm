import Foundation

// 후보키
// 유일하게 식별, 최소성

// r: 1~20 (튜플)
// c: 1~8
// 문자열 길이는 1~8 (소문자와 숫자)

// 20 * 8 * 6 ~~ 1000개 데이터

// 유일성은 Dictionary 같은데, 
// 최소성이 문제네

// 4 + 6 + 4 + 1 > 15개의 조합키
// 유일한가 > 인원 수 
// 최소인가 > set -> 요소를 contain하는가?

// 2^4 > 
// combi

// 조합으로 학번, 이름, 전공, 학년을 키로 설정 

import Foundation

func solution(_ relation: [[String]]) -> Int {
    let rowCount = relation.count
    let colCount = relation[0].count
    var candidateKeys: [Set<Int>] = []
    
    // 1. 모든 컬럼 조합을 비트마스킹으로 탐색 (1부터 2^colCount - 1까지)
    // 예: 컬럼이 3개면 1(001) ~ 7(111)
    for i in 1..<(1 << colCount) {
        var currentCombination = Set<Int>()
        for j in 0..<colCount {
            if (i & (1 << j)) != 0 {
                currentCombination.insert(j)
            }
        }
        
        // 2. 최소성 검사: 이미 등록된 후보키가 현재 조합의 부분집합인지 확인
        if candidateKeys.contains(where: { $0.isSubset(of: currentCombination) }) {
            continue
        }
        
        // 3. 유일성 검사
        var set = Set<String>()
        for row in relation {
            let keyString = currentCombination.map { row[$0] }.joined(separator: "-")
            set.insert(keyString)
        }
        
        if set.count == rowCount {
            candidateKeys.append(currentCombination)
        }
    }
    
    return candidateKeys.count
}

// func solution(_ relation:[[String]]) -> Int {
    
//     var ans: Set<[Key]> = []
    
//     for i in (1...4) {
//         out: for key in combi(i) {
            
//             // key: [Key]가 조합키가 가능한가?
            
//             // 1. 유일성 보장
//             let uniques = Set(relation.map { r in key.map { r[$0.rawValue] }.reduce("", +) })
//             guard relation.count == uniques.count else { continue }
            
            
//             // 2. 최소성 보장
//             if ans.contains(where: { Set($0).isSubset(of: Set(key)) }) { continue }
                
//             ans.insert(key)
//         }
//     }
    
//     return ans.count
// }

func 부분집합(_ keys: [Key]) -> Set<[Key]> {
    
    var ans: Set<[Key]> = []
    var arr: [Key] = []
    
    func select(_ k: Int) {
        
        if k == keys.count {
            if arr.isEmpty { return }
            ans.insert(arr)
            return
        }
        
        arr.append(keys[k])
        select(k+1)
        arr.removeLast()
        
        select(k+1)
    }
    select(0)
    
    return ans
}

enum Key: Int, CaseIterable {
    case studentNum = 0
    case name = 1
    case major = 2
    case year = 3
}

func combi(_ n: Int) -> [[Key]] {
    
    var selection: [[Key]] = []
    var arr: [Key] = []
    
    func select(_ k: Int, _ s: Int) {
        
        if k == n {
            selection.append(arr)
            return 
        }
        
        for i in (s..<4) {
            arr.append(Key.allCases[i])
            select(k+1, i+1)
            arr.removeLast()
        }
    }
    select(0, 0)
    
    return selection
}
