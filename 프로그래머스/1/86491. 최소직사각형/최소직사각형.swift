import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    
    var w: Int = 0
    var h: Int = 0
    
    for array in sizes {
        let sortedArray = array.sorted()
        w = max(w, sortedArray.first ?? 0)
        h = max(h, sortedArray.last ?? 0)
    }
    
    return w * h
}

// 지갑의 크기
// size: 1~1만
// w, h: 1~1000

// 1만개 -> O(N^2)

// 긴거를 기준으로 맞추자. 가로 세로 중
// sizes를 순회하며 긴 거로 Swap
// 각 sizes의 Max 값을 리턴