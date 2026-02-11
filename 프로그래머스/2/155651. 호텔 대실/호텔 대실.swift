import Foundation

// 최소한의 객실 - 예약 손님

// 퇴실 + 10분 청소
// book_time - 최소 객실 수는 몇개?

// n: 1~1000
// 00:00 ~ 23:59

// 시간은 항상 최적

// 분단위 배열로 변환 => +10 청소시간 추가
// 누적합으로 계산
// 1439개 배열 

// O(N)으로 누적합 연산 완료 => Max()!

func solution(_ book_time:[[String]]) -> Int {
    
    var prefixSum = [Int](repeating: 0, count: 1441)
    
    for time in book_time {
        let start = timeToMin(time[0])
        let end = timeToMin(time[1]) + 9 // 청소가 10분이면 10분 뒤부터 빈방! 9분까지는 청소 중
        
        prefixSum[start] += 1
        if end+1 < prefixSum.count { prefixSum[end+1] -= 1 }
    }
    
    for i in 0..<prefixSum.count {
        if i > 0 { prefixSum[i] += prefixSum[i-1] }
    }
    
    return prefixSum.max()!
}

func timeToMin(_ time: String) -> Int {
    let parts = time.split(separator: ":")
    let HH = Int(parts[0])!
    let MM = Int(parts[1])!
    return HH * 60 + MM
}