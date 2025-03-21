import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    // n명의 구매 기준 users: [구매 비율, 플러스 가격]
    // 비율: 1~40
    // 가격: 100~100만
    // m개의 이모티콘 정가 emoticons: 할인율은 10%, 20%, 30%, 40% 중 하나
    // n: 1~100
    // m: 1~7, 정가
    
    // 4^m에 해당하는 케이스를 고려해서 -> 2^14 -> N -> 약 15000개
    // 플러스 가입자, 매출액 배열을 sort -> NlgN 
    // 가장 처음것 리턴
    
    var result: [Int] = [0, 0]
    
    // 1. 각 이모티콘 할인율 순열 계산 -> O(1만 5천)     
    let allPercents = permu(emoticons)
    
    // 2. 플러스, 매출액 계산 -> O(150만 * 7) -> O(1050만)
    for percents in allPercents {
        var plusCnt = 0
        var sale = 0
        
        for user in users {
            let userPercent = user[0]
            let userFee = user[1]
            
            var curSale = 0
            
            // 이모티콘 할인율 체크 & 구입
            for i in 0..<emoticons.count { 
                if percents[i] >= userPercent {
                    curSale += emoticons[i] * (100 - percents[i]) / 100
                }
            }
            
            // 최종 가격 비교
            if curSale >= userFee {
                plusCnt += 1
            } else {
                sale += curSale
            }
        }
        
        // 3. result 업데이트
        if plusCnt > result[0] {
            result = [plusCnt, sale]
        } else if plusCnt == result[0] && sale > result[1] {
            result = [plusCnt, sale]
        }
    }
    
    return result // [플러스 가입자 수, 매출액]
}

func permu(_ emoticons:[Int]) -> [[Int]] {
    var salePercents = [[Int]]()
    
    func permute(_ k: Int, _ percents: [Int]) {
        if k == emoticons.count {
            salePercents.append(percents)
            return
        }
        
        for p in [10, 20, 30, 40] {
            permute(k+1, percents + [p])
        }
    }
    permute(0, [])
    
    return salePercents
}

// 무제한 이모티콘
// 1. 플러스 가입자 최대로
// 2. 판매액 최대로

// n명의 사용자들에게 m개를 할인 판매
// 10~40% 할인 적용
// 사거나 or 플러스 가입하거나

// 사용자들은 일정 비율 이상 할인 이모티콘 모두 구입
// & 구매 합이 일정 가격 이상 시, 취소 후 플러스 가입

