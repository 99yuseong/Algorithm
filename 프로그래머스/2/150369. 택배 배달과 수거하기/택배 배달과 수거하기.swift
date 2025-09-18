import Foundation

// n개의 집에 배달
// 택배 배달 - 수거
// 최대 cap개 실을 수 있다.

// 최소 이동 거리를 리턴해라

// cap: 용량 1~50
// n: 집 1~10만
// d, p: 0~50

// 한 집에 최대 용량만
// 최대 이동 거리 -> 1+...+10만 => Int 안넘침

// 배달 idx
// 픽업 idx

// - O(10만)

// 맨 뒤 인덱스부터 있냐를 확인
// 배달 = 최초 0이상 인덱스 체크, 최대 cap만큼을 빼기
// 픽업 = 최초 0이상 인덱스 체크, 최대 cap만큼을 빼기
// 1번의 왔다갔다 동안 최대 배달 인덱스 중 max * 2를 경로합에 연산
// idx가 모두 0이하다 - 정지

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var D = deliveries
    var P = pickups
    
    var dEnd = n-1
    var pEnd = n-1
    var move = 0
    
    while true {
        
        if dEnd < 0 && pEnd < 0 { break }
        
        var curD = cap
        var curP = cap
        var curM = 0
        
        // 이번 주행에서 최대한 배달
        while dEnd >= 0 && curD > 0 {
            
            if D[dEnd] == 0 { 
                dEnd -= 1
                continue
            }
            
            curM = max(curM, dEnd+1)
            
            // 배달 용량 체크
            if D[dEnd] > curD { 
                D[dEnd] -= curD
                curD = 0
            } else {
                curD -= D[dEnd]
                D[dEnd] = 0
            }
        }
        
        // 이번 주행에서 최대한 수거
        while pEnd >= 0 && curP > 0 {
            if P[pEnd] == 0 { 
                pEnd -= 1 
                continue
            }
            
            curM = max(curM, pEnd+1)
            
            if P[pEnd] > curP {
                P[pEnd] -= curP
                curP = 0
            } else {
                curP -= P[pEnd]
                P[pEnd] = 0
            }
        }
        
        move += curM * 2
    }
    
    return Int64(move)
}