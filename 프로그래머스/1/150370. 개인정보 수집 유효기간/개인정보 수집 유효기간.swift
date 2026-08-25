import Foundation

// 29분~

// 개인정보 n개
// 유효기간

// 파기해야할 개인 정보
// 모든 달은 28일

// 오늘

// today: "YYYY.MM.DD"
// terms: "A MONTH"
// 


// 100개 돌면서 체킹해라

// 1. 날짜를 일 단위로 변경
// 2. 오늘 기준으로 빠졌나?

extension String {
    func toDay() -> Int {
        let date = self.split(separator: ".").map { Int(String($0))! }
        let y = date[0]
        let m = date[1]
        let d = date[2]
        return (y - 2000) * 12 * 28 + (m - 1) * 28 + d
    }
}

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    let today = today.toDay()
    
    var dict: [String: Int] = [:]
    
    for term in terms {
        let t = term.split(separator: " ").map { String($0)}
        dict[t[0]] = Int(t[1])! * 28
    }
    
    var result: [Int] = []
    
    for (idx, privacy) in privacies.enumerated() {
        
        let p = privacy.split(separator: " ").map { String($0) }
        
        let day = p[0].toDay()
        let expire = dict[p[1]]!
        
        if today >= day + expire {
            result.append(idx+1)
        }
    }
    
    return result
}