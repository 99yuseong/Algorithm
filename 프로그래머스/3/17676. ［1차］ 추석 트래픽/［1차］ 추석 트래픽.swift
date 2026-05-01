// 서버 증설

// 초당 최대 처리량
// 1초간 처리하는 요청의 최대개수

func lineToTime(_ time: String) -> (startTime: Int, endTime: Int) {
    
    let t = time.split(separator: " ").map { String($0) }
    
    let resTimeStr = t[1]
    let completeTimeStr = String(t[2].prefix(t[2].count-1))
    
    let resTimeArr = resTimeStr.split(separator: ":").map { String($0) }
    
    let h = Int(resTimeArr[0])!
    let m = Int(resTimeArr[1])!
    let s = Int(String(resTimeArr[2].prefix(2)))!
    let ss = Int(String(resTimeArr[2].suffix(3)))!
    
    let completeTime = Int(Double(completeTimeStr)! * 1000)
    
    
    let endTime = ((h * 60 + m) * 60 + s) * 1000 + ss
    let startTime = max(0, endTime - completeTime + 1)
    
    return (startTime, endTime)
}

func solution(_ lines: [String]) -> Int {
    let times = lines.map { lineToTime($0) }
    var maxCnt = 0
    
    for i in 0..<times.count {
        let sectionStart = times[i].endTime
        let sectionEnd = sectionStart + 999
        
        var count = 0
        
        for j in 0..<times.count {
            if times[j].startTime <= sectionEnd &&
               times[j].endTime >= sectionStart {
                count += 1
            }
        }
        
        maxCnt = max(maxCnt, count)
    }
    
    return maxCnt
}