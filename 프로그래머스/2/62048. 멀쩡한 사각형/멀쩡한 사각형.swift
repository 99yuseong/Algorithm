import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    
    if w == 1 || h == 1 { return 0 }
    
    var boxCntUnderLine: Int = 0
    
    for i in 1..<w {
        boxCntUnderLine += h * i / w
    }
    
    return Int64(boxCntUnderLine * 2)
}

// W * H 직사각형 종이
// 누군가가 잘라둠

// 사용할 수 있는 정사각형의 개수

// W, H: 1~1억 - O(N) or O(NlgN)

// 대각선으로 잘리면서 제거되는 개수 

// Y = H/W * X (Int라서 나머지 날아갈 수도)

// 1. w loop돌면서 h 더하기가 낫겠는데

// Y = 