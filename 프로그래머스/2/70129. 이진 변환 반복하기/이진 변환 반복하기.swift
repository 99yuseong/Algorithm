import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var cnt = 0
    var zeroCnt = 0
    
    while s != "1" {
        let xlen = s.filter { $0 != "0" }.count
        let binary = String(xlen, radix: 2)
    
        cnt += 1
        zeroCnt += s.count - xlen
        s = binary
    }
    
    return [cnt, zeroCnt]
}

// s: 15만 -> O(n) or O(nlgn)
// 포함된 0을 1개씩 지워나간다면...

// 0과 1로 이뤄진 문자열 s
// s가 1이 될때가지 이진변환
// [이진 변환 횟수, 제거된 모든 0의 개수]

// 1. 0을 모두 제거
// 2. x의 길이가 c라면, c를 2진법으로 표현한 문자열로 바꿈