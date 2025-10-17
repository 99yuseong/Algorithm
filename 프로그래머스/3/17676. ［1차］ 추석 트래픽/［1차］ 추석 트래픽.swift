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

// 9만 * 2000

// 각 요소의 시작 시간 & 끝 시간을 포함한 좌우 1초 동안 포함되는 요소를 확인

// [그리디]
// 2000 * 2000 (포함되는 요소의 개수 확인) -> count max치면 가능



func solution(_ lines:[String]) -> Int {
    
    let FIN = 24 * 60 * 60 * 1000 - 1
    
    // ms 단위로 변환
    var lines = lines.map { $0.toTS() }.map { (max(0, $0.S - $0.T + 1), $0.S) }
    
    var maxCnt = 0
    
    for i in 0..<lines.count {
    
        var end = min(FIN, lines[i].1 + 999)
        var cnt = 1
        
        for j in i+1..<lines.count {
            if end >= lines[j].0 { cnt += 1 }
        }
        
        maxCnt = max(maxCnt, cnt)
    }
    
    return maxCnt
}

extension String {
    func toTS() -> (S: Int, T: Int) {
        
        let DTS = self.split(separator: " ").map { String($0) }
        let S = Array(DTS[1]).map { String($0) } // HH:mm:ss.sss
        let T = Array(DTS[2]).map { String($0) } // 0.000s
        
        let H = Int(S[0])! * 10 + Int(S[1])!
        let m = Int(S[3])! * 10 + Int(S[4])!
        let s = Int(S[6])! * 10 + Int(S[7])!
        let ms = Int(S[9])! * 100 + Int(S[10])! * 10 + Int(S[11])!
        
        let msS = ((H * 60 + m) * 60 + s) * 1000 + ms
        let msT = Int(Double(Array(T[0..<T.count-1]).joined())! * 1000)
        
        return (S: msS, T: msT)
    }
}