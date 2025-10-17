// 서버 증설

// 로그데이터 -> 초당 최대 처리량

// 초당 최대 처리량 = 1초간 처리하는 요청의 최대 개수 (응답 여부 상관 X)

// lines.count: 1~2000
// 
// line = [ "2016-09-15 HH:mm:ss.sss 0.000s" ]
//                      S 응답 완료 시간,T 처리시간

// 시작 & 끝 시간을 포함
// T: 0.001 ~ 3.000

// return 초당 최대 처리량


// 1초 구간 => 1000ms

// 풀이

// 1. HH:mm:ss.sss -> ms 단위로 변환 24 * 60 * 60 * 1000 (8640만)
// 2. 시작과 끝 지점 연산   S-T+1ms(시작시간)  S(완료시간) 

// [완전탐색] - 10만 시간을 loop로 돌면서 찾는다? = O(1000억) (시간 초과)
// [그리디]
// [DP] - 8640만 배열 (공간 초과)

// [그리디]
// 2000 * 2000 (포함되는 요소의 개수 확인) -> count max치면 가능
    // 서버 증설 필요 개수가 변하는 시점은 서버 종료 + 1000 지점보다 다른 서버 시작이 있나?
    // count ++


func solution(_ lines:[String]) -> Int {
    
    // ms 단위로 변환
    var lines = lines
        .map { $0.split(separator: " ").map { String($0) } }
        .map { (S: $0[1].dateToMS(), T: $0[2].secondToMS()) } // (S, T)
        .map { (start: $0.S - $0.T + 1, end: $0.S) } // (S - T + 1, S)
    
    var maxCount = 0
    
    for i in 0..<lines.count { // O(2000)
        var count = 1
        for j in i+1..<lines.count { // O(2000)
            if lines[i].end + 1000 > lines[j].start {
                count += 1
            }
        }
        maxCount = max(maxCount, count)       
    }
    
    return maxCount
}

extension String {
    
    // HH:mm:ss.sss -> ms
    func dateToMS() -> Int {
        let comp = self.split(separator: ":")
        
        let H = Int(comp[0])!
        let m = Int(comp[1])!
        let sComp = comp[2].split(separator: ".")
        let s = Int(sComp[0])!
        let ms = Int(sComp[1])!
        
        return ((H * 60 + m) * 60 + s) * 1000 + ms
    }
    
    // 0.000s -> ms
    func secondToMS() -> Int {
        let comp = String(self.prefix(self.count-1))
        return Int(Double(comp)! * 1000)
    }
}