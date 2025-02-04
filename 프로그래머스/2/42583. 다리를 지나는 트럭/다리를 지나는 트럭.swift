import Foundation

// 트럭 - 일차선 다리 건너기
// 모든 트럭이 건너려면 몇초?

// 최대 birdge_length대
// weigth만큼 견뎌
// 완전히 오르지 않는 트럭 무시

// 1초 다리 - 1초 지남

// bl: 1~1만
// w: 1~1만
// tw: 1~1만

// 최소 몇초
// 다리 건너는데 - bl초

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    // 1. t가 흐른다.
    // 2. 만약 Queue[1][1] == t라면 해당 트럭 탈출, Done += 1, w -= 탈출한 트럭 무게
    // 3. curW + nextW <= weight라면
    //  Queue에 [nextW, t+bridge_len] 추가, w += nextW, idx += 1
    // 1,2,3을 D == truck_weights.count 까지 반복
    
    
    var t = 0
    var idx = 0
    var w = 0
    var Done = 0
    var Queue: [[Int]] = []
    
    while Done < truck_weights.count {
        t += 1
        
        if !Queue.isEmpty && Queue[0][1] == t {
            let done = Queue.removeFirst()
            Done += 1
            w -= done[0]
        }
        
        if idx < truck_weights.count && w + truck_weights[idx] <= weight {
            Queue.append([truck_weights[idx], t + bridge_length])
            w += truck_weights[idx]
            idx += 1
        }
    }
    
    return t
}