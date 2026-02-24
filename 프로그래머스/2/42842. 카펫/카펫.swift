import Foundation

// [가로, 세로]
// b: 8 ~ 5000
// y: 1 ~ 200만
// 정사각형이거나 가로로 길다.


// brown + yellow가 나눠떨어지는 [가로, 세로]
// 약수를 찾아서
// 2x + 2y - 4 == brown && x >= y 를 체크

// 1. 

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    let N = brown + yellow
    let possible = (1...N).filter { N % $0 == 0 }
    
    for p in possible {
        
        let x = p
        let y = N / p
        
        if x < y { continue }
        
        if 2 * x + 2 * y - 4 == brown { return [x, y] }
    }
    
    return []
}


