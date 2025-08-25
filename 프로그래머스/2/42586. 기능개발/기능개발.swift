import Foundation

// 기능 개선 작업
// 진도가 100%일때 서비스에 반영 가능
// 개발 속도는 모두 다르다.
// 뒤에 있는 기능은 앞 기능이 배포될때 함께배포 !

// 진도 배열, 속도 배열

// N: 1~100
// 1~100사이의 수 -> Int로 처리해도 된다.
// 배포는 1번 하루의 끝

// 93, 30, 55
// 각 배포때마다 몇개의 작업이 배포되는가?

// 시간이 중요한건 아니다.
// 1. progress를 돌면서 필요한 일 수 계산.
// 2. 총 지나간 일 수 업데이트
// 2. 해당 일수가 지났을때, 진도가 100? 통과

// loop: 배포된 건 수로 카운트 -> progresses의 갯수와 동일할때까지
    // 맨 앞건 필요 일수 계산. d = (100 - p + 1) / speed
    // loop: 진도율 확인하며 p + (d * speed) >= 100 만족 시 배포에 포함

// 최종 값 리턴

// func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
//     var deploys: [Int] = []
//     var totalDeployCount = 0
//     var passedDay = 0
    
//     while totalDeployCount < progresses.count {
        
//         let progress = progresses[totalDeployCount]
//         let speed = speeds[totalDeployCount]
//         let neededDay = Int(ceil(Double(100 - progress) / Double(speed)))
        
//         // 맨앞 작업 배포
//         var curDeployCount = 1
//         totalDeployCount += 1
//         passedDay = neededDay
        
//         // 배포할 수 있는 뒷 작업 배포
//         while totalDeployCount < progresses.count 
//         && progresses[totalDeployCount] + passedDay * speeds[totalDeployCount] >= 100 {
//             curDeployCount += 1
//             totalDeployCount += 1
//         }
        
//         deploys.append(curDeployCount)
//     }
    
//     return deploys
// }

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var p_queue: [Int] = progresses
    var s_queue: [Int] = speeds
    var deploys: [Int] = []
    
    while !p_queue.isEmpty {
        
        var deployCnt = 0
        let day = Int(ceil(Double(100 - p_queue.first!) / Double(s_queue.first!)))
        
        while !p_queue.isEmpty
        && p_queue.first! + day * s_queue.first! >= 100 {
            p_queue.removeFirst()
            s_queue.removeFirst()
            deployCnt += 1
        }
        
        deploys.append(deployCnt)
    }
    return deploys
}



