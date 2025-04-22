import Foundation

extension Array where Element == Character {
    func isSame(_ rangeA: Range<Int>, _ rangeB: Range<Int>) -> Bool {
        return self[rangeA] == self[rangeB]
    }
}

func solution(_ s:String) -> Int {
    
    // ans = s.count
    let N = s.count
    var s = Array(s)
    var ans = s.count
    
    // 1. 1~N까지 압축단위별 Loop
    for i in 1...N {
        var result = ""
        var curIdx = 0
        
        while curIdx < N {
            // 0. 현재 단위 선언
            let unitRange = curIdx..<curIdx+i
            var cnt = 1
            
            // 1. loop로 현재 위치에서 압축
            while curIdx+i*(cnt+1) <= N && s.isSame(unitRange, curIdx+i*cnt..<curIdx+i*(cnt+1)) { 
                cnt += 1 
            }
            
            // 2. cnt > 1이면 cnt + unit result에 추가, else 1개만 추가
            if cnt > 1 {
                result += "\(cnt)" + String(s[unitRange])
                curIdx += i * cnt
            } else {
                result += String(s[curIdx..<min(curIdx+i, N)])
                curIdx += i
            }
        }
    
        // print(result)
        ans = min(ans, result.count)
    }
    
    // 2. ans에 최솟값 업데이트
    
    return ans
}

// 압축할 문자열 s
// 1이상 단위로 문자열을 잘라 압축
// 가장 짧은 것의 길이를 리턴

// 문자가 1개씩 나오면 압축되지 않는다
// 1개 이상의 단위로 자르려고 한다.

// 2개 단위, 3개 단위

// s: 1~1000이하

// 1개 단위 ~ 문장 단위까지 압축

// 그냥 구현? -> 1000 * 1000 * 1000

