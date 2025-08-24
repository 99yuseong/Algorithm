// 트럭 여러대
// 일차선 도로 - 정해진 순
// 다 건너려면 몇 초가 걸리나?

// 다리에는 최대 bridge_length대 만큼
// 그리고 weight를 견딜 수 있다.

// 완전히 오르지 않는 트럭은 무시

// 2대 / 10kg
// 7 4 5 6
// __ 0
// _7 1
// 7_ 2
// _4 3
// 45 4
// 5_ 5
// _6 6
// 6_ 7
// __ 8

// 다리를 다 건너려면 최소 몇 초가 걸리냐?

// N: 1~1만
// M: 1~1만

// 선입 선출 -> Queue
// 1대가 건너려면 bridge_length초가 걸리지
// bridge_length * truck_weights => 1만 * 1만 ok

// 1. 현재 차량 수 ok?
// 2. 현재 무게 ok?
// 3. ok! 그러면 enqueue
// 4. no! 그러면 대기
// 5. 다리에 차가 존재 -> queue.count로 확인
//    & 위치 -> 현재 시각 - 넣은 시각
//    queue: [(weight, time)]
// 6. truck_weights가 비어있고, 다리가 비어있을때 종료

// t (현재시각)
// for truck in truck_weights
//   loop queue not empty 

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var curT = 0
    var curW = 0
    var queue: [(w: Int, t: Int)] = []
    var truckWeights = Array(truck_weights.reversed())
    
    while !queue.isEmpty || !truckWeights.isEmpty {
        
        curT += 1
        
        // 차량 끝 도착
        if !queue.isEmpty 
        && (curT - queue.first!.t) >= bridge_length 
        {
            curW -= queue.first!.w
            queue.removeFirst() 
        }
        
        // 차량 다리 출발
        if !truckWeights.isEmpty 
        && bridge_length >= queue.count + 1
        && weight >= curW + truckWeights.last!
        {
            let truckW = truckWeights.popLast()!
            queue.append((w: truckW, t: curT))
            curW += truckW
        }
    }
    
    return curT
}