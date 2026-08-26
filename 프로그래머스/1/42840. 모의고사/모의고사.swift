import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let p1 = [1, 2, 3, 4, 5]
    let p2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let p3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var score = [0, 0, 0]
    
    for (i, answer) in answers.enumerated() {
        if answer == p1[i % p1.count] { score[0] += 1 }
        if answer == p2[i % p2.count] { score[1] += 1 }
        if answer == p3[i % p3.count] { score[2] += 1 }
    }
    
    let m = score.max()!
    
    return [1, 2, 3].filter { score[$0-1] == m }
}