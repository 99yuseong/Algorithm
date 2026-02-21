import Foundation

// 다이아, 철, 돌 0 ~ 5개
// 피로도 소모

// 곡갱이는 최대 5개만 캘 수 있다.

// 최소 피로도로 광물 캐기

// 주어진 순서대로만 캘 수 있다.
// 1번 선택하면 사용할 수 없을때까지 사용
// 모든 광물 or 캘 수 있을때까지

// 필요한 최소한의 피로도
// 곡갱이의 개수, 광물의 순서

// 그리디인데 이거 위험하다.


// 광물을 다캐거나, 곡객이가 없을때까지 반복
// 피로도만 최소로 유지하면 된다.

// 5~50개 -> 최대 10개의 구간
// 가장 힘든 구간에서 높은 것을 써야한다.


// 10개의 피로도 구간으로 변경, 곡갱이 수만큼 prefix
// 


func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    
    var pick: [Int] = []
    
    for _ in 0..<picks[2] { pick.append(2) }
    for _ in 0..<picks[1] { pick.append(1) }
    for _ in 0..<picks[0] { pick.append(0) }
    
    // 구간
    var level = [Int](repeating: 0, count: min(pick.count, (minerals.count + 4) / 5))
    
    for i in 0..<pick.count*5 {
        
        if i == minerals.count { break }
        
        switch minerals[i] {
        case "diamond": level[i/5] += 10000
        case "iron": level[i/5] += 100
        case "stone": level[i/5] += 1
        default: break
        }
    }
    
    level.sort { $0 > $1 }
    
    var hp = 0
    
    for l in level {
        
        let d = l / 10000
        let i = (l % 10000) / 100
        let s = (l % 100)
        
        let cur = pick.removeLast()
        
        switch cur {
        case 0: // dia
            hp += d + i + s
        case 1: // iron
            hp += d * 5 + i + s
        case 2: // stone
            hp += d * 25 + i * 5 + s
        default: 
            break
        }
    }
    
    return hp
}