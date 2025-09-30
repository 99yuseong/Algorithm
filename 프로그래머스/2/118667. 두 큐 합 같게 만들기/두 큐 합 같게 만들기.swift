import Foundation

// 큐1 - 큐2에서 요소를 각각 pop insert해서 값이 동일하게 되도록 배치
// 길이가 같은 큐가 제공

// 큐의 길이 N: 1~30만
// 원소 크기: 1~10억

// Int64 - 10^18수준

// 원형 큐 -> 배열을 합치고 투포인터 처리

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    let N = queue1.count
    
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    
    if (sum1 + sum2) % 2 != 0 { return -1 }
    
    let target = (sum1 + sum2) / 2
    
    var q = queue1 + queue2
    
    var i1 = 0
    var i2 = N
    
    var k = 0
    
    while k <= 3*N && i1 < q.count && i2 < q.count {
        
        if sum1 == target { return k }
        
        if sum1 < target {
            sum1 += q[i2]
            i2 += 1
            
        } else if sum1 > target {
            sum1 -= q[i1]
            i1 += 1
        }
        
        k += 1
    }
    
    return -1
}