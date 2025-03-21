import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    // cap: 1~50
    // n: 1~10만
    // deliveries: 0~50사이 값
    // pickups: 0~50사이 값
    var dStack = deliveries
    var pStack = pickups
    var distance = 0
    
    // 근데, n을 매번 찾아야하나...?
    // 500만개 배달, 500만개 수거
    // 50개 용량 -> 최대 10만번 배달, 10만번 수거 -> 10만번 왔다갔다.
    while !dStack.isEmpty && dStack.last! == 0 {
        _ = dStack.removeLast()
    }
    
    while !pStack.isEmpty && pStack.last! == 0 {
        _ = pStack.removeLast()
    }
    
    // 10만번 * O(n) > 시간 초과
    while !dStack.isEmpty || !pStack.isEmpty {
        
        distance += max(dStack.count, pStack.count) * 2
        
        var deliver = 0
        var pickup = 0
        
        while !dStack.isEmpty {    
            if deliver + dStack.last! <= cap {
                deliver += dStack.removeLast()
            } else {
                dStack[dStack.count-1] -= cap - deliver
                break
            }
        }
        
        while !pStack.isEmpty {
            if pickup + pStack.last! <= cap {
                pickup += pStack.removeLast()
            } else {
                pStack[pStack.count-1] -= cap - pickup
                break
            }
        }
    }    
    
    return Int64(distance)
}

// n개의 집에 택배 배달 + 수거
// i번째 집은 i만큼 떨어져있다.
// 트럭엔 최대 cap개
// 배달항 택배 상자 수와 빈 상자수
// 모든 배달과 수거를 마치고, 돌아올 수 있는 최소 이동거리
// 배달 수거 개수는 제한 없음

