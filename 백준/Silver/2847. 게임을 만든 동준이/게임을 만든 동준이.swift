// 쉬운 레벨이 어려운 레벨보다 점수를 더 많이 받는 경우
// 특정 레벨의 점수를 감소
func solution(_ N: Int, _ A: [Int]) -> Int {
    var cnt = 0
    var newA = A
    
    for i in stride(from: newA.count-2, through: 0, by: -1) {
        if newA[i+1] <= newA[i] {
            cnt += newA[i] - newA[i+1] + 1
            newA[i] = newA[i+1] - 1
        }
    }
    return cnt
}

let N = Int(readLine()!)!
var A: [Int] = []
for _ in 0..<N { A.append(Int(readLine()!)!) }
print(solution(N,A))
