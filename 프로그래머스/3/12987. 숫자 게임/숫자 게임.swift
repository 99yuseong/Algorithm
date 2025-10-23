import Foundation

// 숫자게임
// A팀 B팀


// 무작위 자연수
// 딱 1번씩 경기
// 숫자 큰 팀이 승리
// 같다면 승점 없음

// B팀이 출전 순서 정했을때, B팀이 얻는 승점

// a: 출전 순서대로 나열된 배열
// b: 부여받은 수 배열

// return 최대 승점

// a.count = 1~10만
// 자연수 = 1~10억


// [그리디]

// 최대 승점 
    // B에서 A보다 크고, 가장 작은 숫자를 배치
    // 만약 큰 수가 없다면, 가장 작은 숫자를 배치

// a.loop
    // b.loop
    // O(N^2) - (시간 초과)

// O(N)으로 만들어야하는 구나. 착각했어
// O(NlgN) or O(N)


// 찾아야하는 건, a[i]보다 크면서 가장 작은 값. lowerbound
// 없다면? -> 가장 작은 값


// 정렬


func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var a = a.sorted { $0 > $1 }
    var b = b.sorted { $0 > $1 }
    
    var winCount = 0
    var bIdx = 0
    
    for target in a {
        if b[bIdx] > target {
            winCount += 1
            bIdx += 1
        }
    }
    
    return winCount
}























