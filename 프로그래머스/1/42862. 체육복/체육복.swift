import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    // 0. 최소 인원 세팅
    var lectureStu = n - lost.count
    
    // 1. 나눠 줄 수 있는 reserve 카운팅
    var lostStu = Set(lost)
    var reserveStu = Set(reserve)
    
    for std in reserve.sorted() {
        
        // 2. 여벌 체육복이 있는 학생인가?
        if lostStu.contains(std) {
            lostStu.remove(std)
            lectureStu += 1
            continue
        }
        
        // 3. 왼쪽 끝
        if std > 1 && lostStu.contains(std-1) && !reserveStu.contains(std-1) {
            lostStu.remove(std-1)
            lectureStu += 1
            continue
        }
        
        // 오른쪽 끝
        if std < n && lostStu.contains(std+1) && !reserveStu.contains(std+1) {
            lostStu.remove(std+1)
            lectureStu += 1
        }
    }
    
    return lectureStu
}

// 전체 n명
// 도난당한 학생 번호 배열
// 여벌 체육복 있는 학생들 번호 배열
// 체육 수업 들을 수 있는 학생의 최댓값

// 체격순으로 번호
// 바로 앞 뒤만 빌려줄 수 있다.

// n: 2~30명
// 도난: 1~n명
// 여벌: 1~n명

// 1 2 3 4 5
//   2   4
//   2 3   5

// 1 2 3 4 5
//   2   4
//     3

// 1 2 3
//     3
// 1

// 1. 전체 수 - 도난 학생 수 계산 n - lost.count
// 2. 도난 학생 중 빌릴 수 있는 경우의 수 체크

// 2. 2^n의 최대 경우의 수
//    모든 경우의 수 탐색도 가능하긴함. 2^30까지니까. 

// 3. reserve 순서대로, 앞뒤에 있으면 찔러넣기로 줘야함. 최대한 옷을 나눠주는 것이 목표이니까 앞에서부터 체크하는 것이 최대