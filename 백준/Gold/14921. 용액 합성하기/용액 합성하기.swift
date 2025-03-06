// -1억~1억 특성값
// 같은 용량 혼합 -> 특성 값의 합
// 특성값의 합이 0에 가장 가까운 용액
// 10ml, 빈 20ml 1개
// 딱 1번밖에 할 수 없음

// 용액이 오름차순으로 주어졌을 때, 특성값 B를 출력
func solution(_ N: Int, _ A: [Int]) -> Int {
    // 오름 차순이다.
    // A[i] + A[j] = 0에 가까운 수라....
    
    // N: 2~10만 -> O(NlgN)
    // -1억 ~ 1억 = 합은 Int 범위 내.
    
    // 투포인터? 이분탐색?
    // st, en
    
    // 만약 N번 순회하면서, 해당 용액의 abs가 최소인 것을 연산한다면?
    // O(NlgN) -> ok
    
    var result = Int.max
    
    for i in 0..<A.count {
        let A1 = A[i]

        var st = i+1
        var en = A.count-1
        
        while st <= en {
            let mid = (st + en) / 2
            // abs(A[mid] + A1)를 최대한 작게 만들어야함

            // A1 < 0, 합 < 0이면 mid ++
            // A1 < 0, 합 > 0이면 mid --
            // A1 > 0, 합 < 0이면 mid ++
            // A1 > 0, 합 > 0이면 min --
           
            if A[mid] + A1 == 0 {
                result = 0
                return 0
            }
            
            if abs(A[mid] + A1) < abs(result) {
                result = A[mid] + A1
            } else if A[mid] + A1 < 0 {
                st = mid + 1
            } else {
                en = mid - 1
            }
        }
    }
    
    return result
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
print(solution(N,A))
