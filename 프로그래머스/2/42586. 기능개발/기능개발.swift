import Foundation

// 진도 100에 서비스 반영
// 뒷 기능은, 앞 기능 배포시 함께 배포
// 배포 순서대로 p배열
// 각각의 속도 s배열
// 배포마다 몇개의 기능이 배포 되는 지를 return

// 작업은 100개 이하
// 진도는 100미만 (0~99짜리 진도)
// 속도는 100이하
// 배포는 하루 1번(끝)

// 93 30 55
// 1 30 5

// 1일 - 94 60 60
// 2일 - 95 90 65
// 3일 - 96 100 70
// ...

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var result: [Int] = []
    var p: [Int] = [] // Queue
    var s: [Int] = [] // Queue
    
    // Queue 생성
    for i in 0..<progresses.count {
        p.append(progresses[i])
        s.append(speeds[i])
    }
    
    // Queue가 빌때까지 작업
    while !p.isEmpty {
        
        // 작업 진행도 업데이트
        for i in 0..<p.count { 
            p[i] += s[i] 
        }
        
        // 완료 작업 카운트
        var doneCnt = 0
        while !p.isEmpty && p.first! >= 100 {
            p.removeFirst()
            s.removeFirst()
            doneCnt += 1
        }
        
        // 1개 이상 작업 완료 시
        if doneCnt != 0 { 
            result.append(doneCnt)
        }
    }
    
    return result
}