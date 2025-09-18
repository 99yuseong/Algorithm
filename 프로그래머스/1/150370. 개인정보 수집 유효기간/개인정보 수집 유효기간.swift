import Foundation

// 개인 정보 - 약관 - 보관 유효기간
// A 12달 - 2021 1월 5일 > 2022 1월 5일부터 파기

// 오늘 날짜로 파기해야할 개인 정보

// 모든 달은 28일까지


// today 오늘
// 약관의 유효기간 terms
// 개인정보 privacies

// 파기해야할 개인정보 -> 오름차순으로 리턴

// today "YYYY.MM.DD"
// terms [ "A 1", "B 100" ] count: 1~20
// privacies [ "YYYY.MM.DD A", "YYYY.MM.DD B" ], count: 1~100 today 이전 날짜만, terms 있는 약관만

// YYYY 2000~2022
// MM 01 ~ 12
// DD 01 ~ 28

// 파기 정보는 최소 1개 이상

// 1. 날짜 -> 숫자로 변경
// 2. 개월 * 28 더한 최종값 배열로 변경
// 3. today보다 작은 값 filter
// 4. sort

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    // 오늘 날짜 -> 숫자로
    let today = today.toDay()
    
    // 약관 개월 수로 변경
    var TermMonth: [String: Int] = [:]
    
    for term in terms {
        let t = term.split(separator: " ").map { String($0) }
        TermMonth[t[0]] = Int(t[1])!
    }
    
    return privacies
        .map { $0.split(separator: " ").map { String($0) } }
        .map { $0[0].toDay() + TermMonth[$0[1]]! * 28 }
        .enumerated()
        .filter { $0.1 <= today } // 오늘 날짜랑 같으면 만료된 것
        .map { $0.0 + 1 }
        .sorted()
}

extension String {
    func toDay() -> Int {
        // "YYYY.MM.DD"
        
        let MONTH = 12
        let DAY = 28
        
        let YMD = self.split(separator: ".").map { String($0) }
        let Y = Int(YMD[0])! - 2000
        let M = Int(YMD[1])! - 1
        let D = Int(YMD[2])!
        
        return Y * MONTH * DAY + M * DAY + D
    }
}