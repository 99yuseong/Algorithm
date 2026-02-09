import Foundation

// 새로운 메뉴
// 단품 > 코스요리 재구성
// 조합 구성
// 가장 많이 함께 주문한 단품으로 코스 구성

// 최소 2가지 이상 & 최소 2명 이상의 손님이 주문

// 각 손님은 2개 이상 주문 필수 (A ~ Z) 26로 표기
// set > subset 확인

// ! 가장 많이 > 동점도 나올 수 있다

// orders: 2~20개의 주문서, 2~10자의 문자열, 대문자, 중복 X (안전)
// course: 메뉴 갯수, 오름차순 정렬, 중복 X (안전)

// > 메뉴 구성 문자열 배열로 리턴 
    // 사전 오름차순 정렬
    // 동률이 여러개라면 모두 return
    // 답은 1이상의 길이가 되도록 주어진다

// 1. 주문 > Set && 전체 Set 구성
// 2. result
// 3. course를 돌면서
    // [조합: cnt]
    // 전체 Set에서 n개 추출
    // 2-1. 각 주문에 대해 subset 여부 확인 cnt++
    // 가장 높은 것 result에 추가


func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    let orders = orders.map { Array($0).map { String($0) } }.map { Set($0) }
    
    var result: [String] = []
    
    for c in course { // 10
        
        var D: [String: Int] = [:]
        
        for o in orders {
            var combis: [Set<String>] = combi(c, Array(o))
            
            for combi in combis {
                if combi.isSubset(of: o) {
                   let key = Array(combi).sorted().reduce("", +)
                    D[key, default: 0] += 1
                }   
            }
        }
        
        if !D.isEmpty {
            let maxCnt = D.values.max()!
            result.append(contentsOf: D.filter { $0.value == maxCnt && $0.value >= 2 }.map { $0.key })       
        }
    }
    
    return result.sorted()
}

func combi(_ n: Int, _ arr: [String]) -> [Set<String>] {
    
    var result: [Set<String>] = []
    var curSelect: Set<String> = []
    
    func select(_ k: Int, _ s: Int) {
        
        if k == n {
            result.append(curSelect)
            return
        }
        
        for i in s..<arr.count {
            curSelect.insert(arr[i])
            select(k+1, i+1)
            curSelect.remove(arr[i])
        }
    }
    select(0, 0)
    return result
}