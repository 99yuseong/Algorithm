// 증가하는 부분 수열
// 가장 긴 증가하는 부분 수열
// 길이, 수열 출력
func solution(_ N: Int, _ A: [Int]) -> (Int, [Int]) {
    // 증가하는 부분 수열이라...
    // N: 1~1000 -> O(N^3)까지 가능
    // 수열: A
    
    // 1. 우선 증가하는 부분 수열의 최대 길이 계산
    // D[i]: i번째 수를 포함하는 증가하는 수열의 최대 길이
    // D[i] = D[j] + 1 if A[j] < A[i], && D[j] + 1 > D[i] where 0 <= j < i
    // i보다 작은 수 j에 대해 1. 증가하고, 2. j을 마지막으로 하는 수열 + 1이 D[i]보다 큰 경우를 업데이트
    
    var D = Array(repeating: 1, count: N)
    var P = Array(repeating: -1, count: N)
    
    for i in 0..<N {
        for j in 0..<i {
            if A[j] < A[i] && (D[j]+1 > D[i]) {
                D[i] = D[j] + 1
                P[i] = j
            }
        }
    }
    
    let maxLength = D.max()!
    var lastIndex = D.firstIndex(of: maxLength)!
    
    // 2. 역추적을 통해 해당 수열 계산
    var arr: [Int] = []
    while lastIndex != -1 {
        arr.append(A[lastIndex])
        lastIndex = P[lastIndex]
    }
    
    return (maxLength, arr.reversed())
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
let ans = solution(N, A)
print(ans.0)
print(ans.1.map { String($0) }.joined(separator: " "))
