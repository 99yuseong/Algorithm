import Foundation

// 이익 10% 추천인 - 이익 90% 본인
// 원단위 - 1원 미만 - 자신이 모두 가짐

// enroll: [이름]
// referral

// enroll.count = 1~1만
// (민호 제외)

// referral.count == enroll.count

// 이익금을 나열한 배열을 리턴
// return []

// 1~1만
// enroll[i] = 등록된 사람 (10글자)
// referral[i] = 추천인

// 1~10만
// seller[j] = 판매자 이름 (중복)
// amount[j] = 판매량 (1~100개) * 100원

// 1. Dict > ["이름"] = idx - O(1만)
// 2. O(10만) * O(lg1만)

// loop seller

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    var enroll = enroll
    var referral = referral
    
    enroll.insert("-", at: 0)
    referral.insert("-", at: 0)
    
    var IDX: [String : Int] = [:]
    var PROFIT = [Int](repeating: 0, count: enroll.count)
    
    for i in 0..<enroll.count {
        IDX[enroll[i], default: -1] = i
    }
    
    
    for i in 0..<seller.count {
        
        var sellerName: String = seller[i]
        var referralName: String = referral[IDX[sellerName]!]
        var profit = amount[i] * 100
        
        while sellerName != "-" && profit > 0 {
            
            let sellerProfit = profit - (profit / 10)
            PROFIT[IDX[sellerName]!] += sellerProfit
            
            sellerName = referralName
            referralName = referral[IDX[sellerName]!]
            profit = profit / 10
        }
    }
    
    return Array(PROFIT.suffix(PROFIT.count-1))
}