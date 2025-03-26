func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {    
    
    var timetable: [Int] = timetable.sorted().map { str in
        let time = str.split(separator: ":").map { Int(String($0))! }
        return time[0] * 60 + time[1]
    }
    
    var buses: [[Int]] = Array(repeating: [], count: n)
    var curIdx = 0
    var curTime = 9 * 60 // 540분
    
    // 1. n회 버스에 크루를 나눠 담기
    for kth in 0..<n {
        while curIdx < timetable.count 
            && timetable[curIdx] <= curTime 
            && buses[kth].count < m
        {
            buses[kth].append(timetable[curIdx])
            curIdx += 1
        }
        curTime += t
    }
    
    // 2. 마지막 버스부터 첫 버스까지 탈 수 있는 지를 확인
    var kun = Int.max
    for i in stride(from: n-1, through: 0, by: -1) {
        let bus = buses[i]
        let busTime = 540 + t * i
        
        if bus.count < m { return busTime.toTable() }
        else { return (bus.last! - 1).toTable() }
    }
    
    return ""
}

extension Int {
    func toTable() -> String {
        let HH = self / 60 < 10 ? "0\(self / 60)" : "\(self / 60)"
        let MM = self % 60 < 10 ? "0\(self % 60)" : "\(self % 60)"
        return HH + ":" + MM
    }
}

// n: 1~10회
// t: 1~60분
// m: 1~45명
// timetable: 1~2000
// HH:MM 00:01~23:59
// 콘: 00:00~23:59

// 판교역 -> 사무실
// 09:00부터 n회 t분 간격으로 역에 도착, 최대 m명이 탈 수 있다.

// 콘은 제일 뒤에 선다.
// 모든 크루는 23:59에 집으로
// 다음날 셔틀을 타는 일이 없다.

// 셔틀을 타고 사무실로 갈 수 있는 도착시간 중 제일 늦은 시간

// 1회 1분간격 최대 5명
// 현재 4명 -> 콘 -> 09:00

// 2회 10분 간격 최대 2명
// 08:00 / 09:09 -> 콘 -> 09:09

// 2회 1분간격 최대 2명
// 다른 크루 기다리면 못탐 -> 콘 -> 08:59
// 못타는 경우엔 가장 이른 시간 -1

// 1회 1분간격 최대 5명
// 못탐 -> 00:00

// 1회 1분 간격 최대 1명
// 09:00 대기

// 10회 60분 45명
// 16명 대기 중, 충분 -> 가장 늦은 시간.
