import Foundation

// 10초전, 10초후, 건너뛰기

// prev - 10초전, 10초미만 - 0초로
// netxt - 10초후, 10초미만 - 동영상의 길이
// 건너뛰기 - op_start <=

// mm:ss

// 0 ~ 3599 - 3600개
// 현재 재생위치가 - 오프닝일경우 자동으로 끝나는 위치로 이동
// cmd: 1~100

// 1. mm:ss > 초단위로 변경
// 2. cmd 
// 2. next = min(videoLen, pos+10)
// 2. prev = max(0, pos-10) if op_start...op_end ~= pos { pos = op_end }

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    
    let videoLen = time2Sec(video_len)
    let opStart = time2Sec(op_start)
    let opEnd = time2Sec(op_end)
    var pos = time2Sec(pos)
    
    if (opStart...opEnd) ~= pos {
        pos = opEnd
    }
    
    for cmd in commands {
        
        if cmd == "next" {
            pos = min(videoLen, pos + 10)
        } else {
            pos = max(0, pos - 10)
        }
        
        if (opStart...opEnd) ~= pos {
            pos = opEnd
        }
    }
    
    return sec2Time(pos)
}

func time2Sec(_ time: String) -> Int {
    let parts = time.split(separator: ":").map { Int(String($0))! }
    let m = parts[0]
    let s = parts[1]
    return m * 60 + s
}

func sec2Time(_ sec: Int) -> String {
    let m = sec / 60
    let s = sec % 60
    let mm = (0...9) ~= m ? "0\(m)" : "\(m)"
    let ss = (0...9) ~= s ? "0\(s)" : "\(s)"
    return mm + ":" + ss
}

