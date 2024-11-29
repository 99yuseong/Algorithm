// 수열 A
// 증가하는 가장 긴 부분 수열
// 길이

// 수열 A의 크기 N 1~1000사이
// 각 원소는 1~1000

// 증가하는 부분 수열 중 가장 긴 수열

// D[i] : (i번째 원소를 포함) 증가하는 수열 중 길이가 가장 긴 수열의 길이
// D[i] = max(D[j]+1, D[i])

let N = Int(readLine()!)!
var A = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var D = Array(repeating: 0, count: N+1)

for i in 1...N {
    D[i] = 1
    for j in 1..<i {
        if A[j] < A[i] {
            D[i] = max(D[j] + 1, D[i])
        }
    }
}
print(D.max()!)
