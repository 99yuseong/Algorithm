// 증가하는 부분 수열 중 합이 가장 큰 것

// N  1~1000개
// A  1~1000 범위

// D[i] : (i번째 원소를 포함) 증가하는 수열 중 합이 가장 큰 수
// 최종적으로 D[0], D[1], ... D[N-1] 중 최댓값을 찾아야 한다.

// D[i] -> i보다 인덱스가 낮은 값인 j가 A[j] < A[i]인 경우,
// max(D[j] + A[i], D[i])를 계속 구하면서 시작 인덱스를 전진
// 그러면 D[i]와 증가하는 수열의 합 중, i번째를 포함한 수의 최댓값을 구할 수 있다.


let N = Int(readLine()!)!
let A = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
var D = Array(repeating: 0, count: N+1)

for i in 1...N {
    D[i] = A[i]
    for j in 1..<i {
        if A[j] < A[i] {
            D[i] = max(D[j] + A[i], D[i])
            // 현재 인덱스까지의 합이 큰 수 + i번째 값과 이전 인덱스까지 오면서 합이 큰 수를 비교
        }
    }
}
// 결론적으로 1번째 ~ N번째 수를 포함한 증가 수열합이 각각 저장된 D가 만들어짐
print(D.max()!)
