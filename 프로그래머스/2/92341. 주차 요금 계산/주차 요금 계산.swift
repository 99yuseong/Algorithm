import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    // records는 최대 1000개
    
    // O(n)
    let times: [String: Int] = calculateTime(fees, records)
    
    // O(nlogn) -> 1000대
    let cars: [String] = times.keys.sorted() // 자동차 번호판 문자열 배열
    var totalFee: [Int] = []
    
    // O(n)
    for car in cars {
        totalFee.append(caculateFee(fees, times[car]!))
    }
    
    return totalFee // 차량번호 작은 순으로 요금 정렬
}

// 주차 요금 계산
// 입차, 출차 기록

// 기본시간 / 기본요금 / 단위 시간 / 단위 요금

// fee [기본시간, 기본요금, 단위시간, 단위요금]
// record "HH:MM 0000 IN"
// record "HH:MM 0000 OUT"

// 1. 차량 별 누적시간 -> Dictionary에 저장, 누적시간["차량번호"]
// 2. 딕셔너리.keys -> 배열, 차량번호별 정렬 > 차[차량인덱스] = 차량번호
// 2. 차량 별 요금 -> 요금[차량인덱스] = 요금
func calculateTime(_ fees:[Int], _ records: [String]) -> [String: Int] {
    var totalTime: [String: Int] = [:]
    var curRecords: [String: Int] = [:]
    
    for record in records {
        let TNIO = record.split(separator: " ").map { String($0) }
        let (T,N,IO) = (TNIO[0], TNIO[1], TNIO[2])
        
        let min = Int(String(T.prefix(2)))! * 60 + Int(String(T.suffix(2)))!
        
        if IO == "IN" { // 차량 진입
            curRecords[N] = min // 시간 기록
        } else { // 차량 출차
            totalTime[N, default: 0] += min - curRecords[N]! // 누적 시간 기록
            curRecords[N] = nil // 시간 기록 초기화
        }
    }
        
    // 남은 23:59 이후 기록
    let lastTime = 23 * 60 + 59
    for (carNum, inTime) in curRecords {
        totalTime[carNum, default: 0] += lastTime - inTime
    }
    
    return totalTime
}

// 1. 23:59에 출차된 것으로 간주
// 2. 00:00 ~ 23:59를 일괄 정산
// 3. 누적 < 기본시간 -> 기본 요금
// 4. 누적 >= 기본시간 -> 기본요금 + 올림(초과 시간 / 단위 시간) * 단위 요금
func caculateFee(_ fees:[Int], _ time: Int) -> Int {
    let baseT = fees[0] // 기본시간 1~1439
    let baseF = fees[1] // 기본요금 0~10만
    let unitT = fees[2] // 단위시간 1~1439
    let unitF = fees[3] // 단위요금 1~1만
    
    if time < baseT { 
        return baseF 
    }
    
    // 기본시간 초과
    return baseF + ((time - baseT + unitT - 1) / unitT) * unitF
}
