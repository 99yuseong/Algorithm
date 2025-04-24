import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 1
    var a = (a + 1) / 2
    var b = (b + 1) / 2
    
    while a != b {
        answer += 1
        a = (a + 1) / 2
        b = (b + 1) / 2
    }
    
    return answer
}

// A번을 가진 참가자는 B번 참가자와 몇번째 라운드에서 만나는가?
// N명, A, B 번호
// 몇번째
// 항상 이긴다..


// 2~2^20
// a / 2