import Foundation

func solution(_ citations:[Int]) -> Int {
    
    var C = citations.sorted(by: >)
    var H = 0
    
    for i in 0..<C.count {
        if i+1 <= C[i] { H = i+1 } 
    }
    
    return H
}

// 논문 n편, h번 이상 인용된 논문 h편 이상
// 나머지 논문이 h번 이하 인용되었다면
// h의 최댓값이 H-Idx

// n: 1~1000
// h: 0~10000

// 길이 n의 citations -> O(n^3)
// 작은순 정렬 -> O(nlgn)
// 뒤에서부터, idx+1 == h인 h 찾기 -> O(n)
// O(n) + O(nlgn)