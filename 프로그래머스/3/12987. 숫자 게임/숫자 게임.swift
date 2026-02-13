import Foundation

// N명씩 두팀 숫자게임

// 자연수 숫자로 딱 1회 게임
// 큰쪽이 + 1점
// 비기면 승점이 없음

// 최종 승점이 가장 높은 방법
// B팀의 승점은?

// 10만명의 각팀원
// 숫자는 1~10억

// 이길 수 있는 가장 작은 숫자로 이겨야한다.
// 만약 그리디로 그대로 풀면, 져야하는 상황에서 어거지로 이기는 경우 발생 No

// 사실 a팀의 순서는 중요하지 않다.
// 정렬을 시키고, 가장 작은 상대부터 최소한으로 이기는 것이 중요

// 1. a, b 정렬 / O(10만 + 10만)
// 2. 그냥 b를 모두 소모하면 끝, 이기면++, 지면 그냥 pop

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var a = a.sorted { $0 > $1 }
    var b = b.sorted { $0 > $1 }
    
    var score = 0
    while !b.isEmpty {
        if a.last! < b.last! { 
            score += 1
            a.removeLast()
            b.removeLast()
        } else {
            b.removeLast()
        }
    }
    
    return score
}