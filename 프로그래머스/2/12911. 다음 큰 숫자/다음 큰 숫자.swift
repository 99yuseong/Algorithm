import Foundation

func solution(_ n:Int) -> Int {
    
    let cnt = n.nonzeroBitCount
    
    var answer = n+1
    
    while true {
        if answer.nonzeroBitCount == cnt {
            return answer
        } else {
            answer += 1
        }
    }
}