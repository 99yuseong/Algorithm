import Foundation

// 원형 수열의 연속하는 부분 수열의 합은 몇 가지?
// n: 3~1000개의 숫자
// 1~1000사이니 다 합해도 100만

// 배열 2개를 붙이고,
// 슬라이딩 윈도우로 계산

// 부분 수열의 길이 1 ~ 1000
    // 시작 idx 1 ~ 1000개를 순회
        // idx ~ idx + len - 1까지 합 연산 (최대 1000 합 연산)
            // Set에 삽입

func solution(_ elements:[Int]) -> Int {
    
    let N = elements.count
    let longElements = elements + elements
    var sumSet = Set<Int>()
    
    for len in 1...N {
        for idx in 0..<N {
            var sum = 0
            for i in idx..<idx+len {
                sum += longElements[i]
            }
            sumSet.insert(sum)
        }
    }
    
    return sumSet.count
}