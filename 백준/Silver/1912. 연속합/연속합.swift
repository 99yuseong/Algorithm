// 시간 1초
// 메모리 128MB

// N개의 정수로 된 수열
// 연속된 1개 이상의 수를 선택했을때 합이 가장 큰 것

// N  개수  1~100000(십만)
// 수는 -1000 ~ 1000 -1억 ~ 1억

// D[N]: "N번째 수를 포함"한 연속합의 최댓값
// D[N] = max(D[N-1]+A[N], A[N])
// 즉, N-1번째 수를 포함한 최댓값에 A[N]을 추가로 포함하는 게 더 큰가 
// (이전 연속합이 음수인 경우)
// 아니면, A[N]자체로 혼자 시작하는게 더 큰가

let N = Int(readLine()!)!
var A = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var D = Array(repeating: -1001, count: N+1)

for i in 1...N {
    D[i] = max(D[i-1] + A[i], A[i])
}
print(D.max()!)

