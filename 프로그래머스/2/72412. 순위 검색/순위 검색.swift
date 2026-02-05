import Foundation

// 언어 cpp java python
// 직군 frontend backend
// 경력 junior senior
// 음식 chicken pizza
// 점수 X점

// 조건 분석 도구 - 다양한 문의

// " " 로 구분
// "java backend junior pizza 150"
// "java and backend and junior and pizza 100"
// "cpp and - and senior and pizza 250"

// info: 1~5만
// query: 1~10만

// score: 1~10만


// 1. query를 돌면서 - info를 탐색
// 10만 * 5만 * 5 => 불가능하다.
// 무작정 탐색은 안됨

// - 정렬된 상태라면? / 여러 조건이라 정렬은 힘듬
// 숫자로 표현한다면? 

// 3212 번호로 방을 나누고, 해당 방에서 높은 순 정렬 / lowerBound + 1이 몇명인지 확인 가능

// 1. info 가공
// 2. info 정렬
// 3. query 가공
// 3. query * lowerbound -> ans

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    // 1. info 조합을 Hash로 저장
    var Dict: [String: [Int]] = [:]
    
    for i in info {
        let parts = i.split(separator: " ")
        let languages = [parts[0], "-"]
        let works     = [parts[1], "-"]
        let cares     = [parts[2], "-"]
        let foods     = [parts[3], "-"]
        let score     = Int(parts[4])!
        
        for language in languages {
            for work in works {
                for care in cares {
                    for food in foods {
                        let key = "\(language)\(work)\(care)\(food)"
                        Dict[key, default: []].append(score)
                    }
                }
            }
        }
    }
    
    // 2. Hash를 모두 정렬
    for (key, value) in Dict {
        Dict[key] = value.sorted()
    }
    
    // 3. Query 탐색
    
    var ans: [Int] = []
    
    func lowerBoundIdx(_ arr: [Int], _ score: Int) -> Int {
        
        var st = 0
        var en = arr.count
        
        while st < en {
            let mid = (st + en) / 2
            
            if arr[mid] < score {
                st = mid + 1
            } else {
                en = mid
            }
        }
        
        return st
    }
    
    for q in query {
        let parts = q.split(separator: " ").filter { $0 != "and" }
        let key = "\(parts[0])\(parts[1])\(parts[2])\(parts[3])"
        let score = Int(parts[4])!
        
        if let arr = Dict[key] {
            let idx = lowerBoundIdx(arr, score)    
            ans.append(arr.count - idx)
        } else {
            ans.append(0)
        }
    }
    
    return ans
}
