import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    let N = progresses.count
    
    var progresses = progresses
    
    var result: [Int] = []
    var deploy: Int = 0
    
    while deploy != N {
        
        var curDeploy = 0
        
        for i in 0..<N {
            
           guard progresses[i] != -1 else { continue }
            
            if progresses[i] < 100 {
                progresses[i] = min(100, progresses[i] + speeds[i])
            }
        
            if progresses[i] >= 100 && deploy + curDeploy >= i {
                curDeploy += 1
                progresses[i] = -1
            }
        }
        
        if curDeploy > 0 {
            result.append(curDeploy)
            deploy += curDeploy
        }
    }
    
    return result
}