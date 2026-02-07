import Foundation

// c - 1~8개의 항목이 있다.
// r - 1~10개의 줄이 들어온다.
// 각 문자열 항의 길이는 1~8의 소문자와 숫자다.

// 모두 유일하게 식별 가능하다! / 아니라면 Set으로 처리해야하고

// 유일성과 최소성을 만족시켜야한다.

// 1. 유일성 - 각 Key로 변환한 값의 개수가 r의 개수와 같아야한다.
// 2. 최소성 - 가장 작은 수로 구성된 Key부터 진행하면서, 최종 결과에 현재 Key가 포함되었는 지 확인해야한다.

func solution(_ relation:[[String]]) -> Int {
    
    let c = relation[0].count
    let r = relation.count
    
    var uniqueKey: [Set<Int>] = []
    var minimumKey: [Set<Int>] = []
    
    // 1. 각 컬럼의 조합을 모두 돌면서 확인 - 2^8 = 256개
    // c를 조합으로 확인
    for i in 1..<(1 << c) {
        
        // 0. 조합 선택
        var curCombi: [Int] = []
        for j in 0..<c {
            if i & (1 << j) != 0 {
                curCombi.append(j)
            }
        }
        
        // 1. 유일성 ex) [0, 1, 3]
        let uniques: [String] = relation.map { r in
            curCombi.map { r[$0] }.joined(separator: "/")
        }
        guard r == Set(uniques).count else { continue }
        
        uniqueKey.append(Set(curCombi))
    }
    
    
    // 2. 최소성
    uniqueKey.sort { $0.count < $1.count }
    for key in uniqueKey {
        if minimumKey.contains { $0.isSubset(of: key) } { continue }
        minimumKey.append(key)
    }
    
    return minimumKey.count
}