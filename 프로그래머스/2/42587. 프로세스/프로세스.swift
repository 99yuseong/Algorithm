import Foundation

// 63분 ~ 

// 


func solution(_ priorities:[Int], _ location:Int) -> Int {
   
    let N = priorities.count
    var p = priorities
    p.sort()
        
    var completed = [Bool](repeating: false, count: N)
    var curIdx = 0
    var answer = 0
    
    while true {
        if !completed[curIdx] && p.last! == priorities[curIdx] {
            
            completed[curIdx] = true
            answer += 1
            p.popLast()
            
            if curIdx == location { break }
        }
        curIdx = (curIdx + 1) % N
    }
    
    return answer
}