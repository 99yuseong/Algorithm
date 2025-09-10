// 출 - d - 도착

//    바위 바위 
// 제거할 바위 수 n
// 바위 제거 후 거리의 최솟값중 가장 큰 값

// n개의 바위를 제거하는 경우의 수
// -> 해당 경우에 최소 거리 중 최댓값

// 2 14 11 21 17
// -> 2 11 14 17 21 (정렬)
// 제거한 후의 각 바위사이의 거리 

// distance: 1~10억
// 바위 개수: 1~5만
// n: 1~5만

// 1개이상의 바위를 제거할 때 최솟값이라.

// 직관적으로 바위가 K개라고 하면
// 0. 바위 정렬 - O(NlgN)
// 1. K개 중 N개 선택 - O(KCN) 5만! / 2.5만! * 2.5만!.... -> 불가...
// 2. K-N+1개 중 max 선택 - O(K-N+1)


// n개를 제거할건데, 가장 좁은 길 중 최대 = 가장 공평하게 공간을 배치한게 뭐냐?
// -> n개의 바위를 제거할때, lowerbound 중 가장 큰 것

// 2 - 9 - 3 - 3 - 4 - 4 = 25

// 거리 k lowerbound
    // 0 ~ 10억
// 만족하냐? n개를 다쓰지 않아도 만족하나?
// NlgN이면 되잖아.

// 거리리스트에서 -> O(N)으로 돌면서 -> 최솟값을 제외하면
// removed[i] = true
// 3차원 배열을 만들어야하네


// 거리가 k가 되려면 n개를 무엇을 제거해야하나.
// 가장 짧은 거리가 k가 되려면 몇개가 제거되어야 하나

// 0. 바위 정렬 - O(NlgN)
// 1. [Int] - 거리 리스트로 변환 - O(N)
// 2. 거리 리스트 정렬 - O(NlgN)
// 3. 최소거리가 k라고 할때 m개의 바위가 제거되어야하는 지 확인 - O(N)
// 4. 이분탐색 반복 

import Foundation

func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
    // 바위 위치 정렬 (출발점 0, 도착점 distance 포함)
    var positions = [0] + rocks.sorted() + [distance]
    
    // 이분탐색 범위 설정
    var left = 1
    var right = distance
    var answer = 0
    
    // 주어진 최소거리 minDist로 n개 이하의 바위를 제거해서 달성 가능한지 확인
    func canAchieve(minDist: Int) -> Bool {
        var removed = 0
        var lastPos = 0  // 마지막으로 남긴 바위의 인덱스
        
        for i in 1..<positions.count {
            // 현재 바위와 마지막으로 남긴 바위 사이의 거리가 minDist보다 작으면 제거
            if positions[i] - positions[lastPos] < minDist {
                removed += 1
            } else {
                lastPos = i  // 이 바위는 남김
            }
        }
        
        return removed <= n
    }
    
    // 이분탐색으로 최적의 최소거리 찾기
    while left <= right {
        let mid = (left + right) / 2
        
        if canAchieve(minDist: mid) {
            answer = mid
            left = mid + 1  // 더 큰 최소거리도 가능한지 확인
        } else {
            right = mid - 1  // 이 거리는 불가능하므로 범위 줄이기
        }
    }
    
    return answer
}








