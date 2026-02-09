import Foundation

// 4가지 항목 - 반드시

// lang: cpp / java / python
// pos: backend / frontend
// year: junior / senior
// food: chicken / pizza
// score

// 해당 조건을 만족하는 지원자 몇명?

// -> 일부만 조건을 줄수도 있다.

// info: [언어 직군 경력 푸드 점수]
// query: []
// -> [몇명, 몇명, ...]

// [제한 조건]
// info: 응시자 1~5만명, 점수 1~10만점
// query: 질문 1~10만개, 구분 and
    // - : 고려하지 않겠다.
    // and와 space로 구분


// 1. 우선 q를 돌면서 info를 순회하는 것은 불가능 - 시간 초과

// 2-1. 모든 경우의 수 > Dict로 구성 / lang, pos, year, food를 key로 구성
// 2-2. 5만명을 순회하면서 점수를 삽입
// 2-3. 삽입된 점수 배열을 모두 정렬
// 2-4. 10만 질문을 순회하면서 Dict에서 lowerbound를 찾음 > O(nlgn)

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    let lan = ["cpp", "java", "python", "-"]
    let pos = ["backend", "frontend", "-"]
    let year = ["junior", "senior", "-"]
    let food = ["chicken", "pizza", "-"]
    
    var D: [String: [Int]] = [:]
    for l in lan {
        for p in pos {
            for y in year {
                for f in food {
                    D["\(l)_\(p)_\(y)_\(f)", default: []] = []
                }
            }
        }
    }
    
    for i in info {
        let parts = i.split(separator: " ").map { String($0) }
        let lan = parts[0]
        let pos = parts[1]
        let year = parts[2]
        let food = parts[3]
        let score = Int(parts[4])!
        
        for l in [lan, "-"] {
            for p in [pos, "-"] {
                for y in [year, "-"] {
                    for f in [food, "-"] {
                        let key = "\(l)_\(p)_\(y)_\(f)"                
                        D[key]!.append(score)
                    }
                }
            }
        }
    }
    
    for (k, _) in D {
        D[k]!.sort()
    }
    
    func higherScore(_ score: Int, _ arr: [Int]) -> Int {
        
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
        
        return arr.count - st
    }
    
    var ans: [Int] = []
    for q in query {
        let parts = q.split(separator: " ").map { String($0) }.filter { $0 != "and" }
        let lan = parts[0]
        let pos = parts[1]
        let year = parts[2]
        let food = parts[3]
        let score = Int(parts[4])!
        let key = "\(lan)_\(pos)_\(year)_\(food)"
        
        ans.append(higherScore(score, D[key]!))
    }
    
    return ans
}