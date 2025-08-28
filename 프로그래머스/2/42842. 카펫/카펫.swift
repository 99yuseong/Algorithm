// 갈색 격자의 수, 노란색 격자의 수
// 카펫의 가로 세로 크기를 순서대로 배열 [가로, 세로]

// b: 8~5000
// y: 1~200만
// 가로 >= 세로

// 가로 * 세로 = b + y
// 가로 + 세로 = (b + 4) / 2

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    let area = brown + yellow
    
    for h in 3...Int(sqrt(Double(area))) {
        if area % h == 0 {
            let w = area / h
            if w >= h && (w + h) == (brown / 2 + 2) { 
                return [w, h]
            }
        }    
    }
    
    return []
}