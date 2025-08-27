// 찍는다.
// 1 - 12345
// 2 - 21232425
// 3 - 3311224455

// N - 1만
// 가장 많이 맞춘 사람을 배열에 리턴
// 동점자는 정렬

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let first = [1, 2, 3, 4, 5]
    let second = [2, 1, 2, 3, 2, 4, 2, 5]
    let third = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var score = [0,0,0]
    
    // 계산
    for (idx, answer) in answers.enumerated() {
        score[0] += first[idx % first.count] == answer ? 1 : 0
        score[1] += second[idx % second.count] == answer ? 1 : 0
        score[2] += third[idx % third.count] == answer ? 1 : 0
    }
    
    let max = score.max()!
    
    return (1...3).filter { score[$0-1] == max }
}