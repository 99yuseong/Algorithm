import Foundation

// 영상에 광고
// 가장 많이 보는 구간 - 광고

// 재생구간 기록 - 광고 위치 선택

// 광고는 영상과 동시에 재생

// 총 재생시간
// 광고시간
// ID / 시작 / 종료
// 누적 재생시간 

// 누적 재생시간이 가장 많이 나오는 곳에 공익광고 삽입
// return 시작 시각

// HH:MM:SS 1~359999
// logs: 1~30만

// H1:M1:S1-H2:M2:S2
// 1초차이 발생하도록 무조건
// 시간은 범위 안에서 / 잘못된 입력 없음

// 재생시간 = 종료 - 시작

// 누적 재생시간을 비교해야함

// 1. 초단위로 다 변경 - 36만
// 2. 30만개 loop 초단위로 변경 > diff 처리
// 3. 누적합 - O(30만)
// 4. 0 ~ 끝까지
    // 처음에 광고 재생동안 시청자 연산 - O(30만)
        // + - 로 전진

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    
    let playTime = time2Sec(play_time)
    let advTime = time2Sec(adv_time)
    
    if playTime == advTime { return sec2Time(0) }
    
    var viewer = [Int](repeating: 0, count: playTime + 1)
    
    // O(30만)
    for log in logs {
        let parts = log.split(separator: "-").map { String($0) }
        let start = time2Sec(parts[0])
        let end = time2Sec(parts[1])
        viewer[start] += 1
        if end < viewer.count { viewer[end] -= 1 }
    }
    
    // O(36만)
    for i in 0..<viewer.count {
        if i > 0 { viewer[i] += viewer[i-1] }
    }
    
    var startTime = 0
    var maxViewTime = 0
    var adViewTime = 0
    
    for i in 0..<advTime {
        adViewTime += viewer[startTime+i]
    }
    maxViewTime = adViewTime
    
    // playTime > advTime 보장 = playTime+1 - advTime > 2 보장
    for i in 1..<viewer.count-advTime {
        
        adViewTime -= viewer[i-1]
        adViewTime += viewer[i+advTime-1]
        
        if adViewTime > maxViewTime {
            startTime = i
            maxViewTime = adViewTime
        }
    }
    
    return sec2Time(startTime)
}

func sec2Time(_ sec: Int) -> String {
    let H = sec / 3600
    let M = (sec % 3600) / 60
    let S = (sec % 3600 ) % 60
    
    let HH = (0...9) ~= H ? "0\(H)" : "\(H)"
    let MM = (0...9) ~= M ? "0\(M)" : "\(M)"
    let SS = (0...9) ~= S ? "0\(S)" : "\(S)"
    
    return HH + ":" + MM + ":" + SS
}

func time2Sec(_ time: String) -> Int {
    let parts = time.split(separator: ":").map { String($0) }
    let HH = Int(parts[0])!
    let MM = Int(parts[1])!
    let SS = Int(parts[2])!
    return HH * 60 * 60 + MM * 60 + SS 
}