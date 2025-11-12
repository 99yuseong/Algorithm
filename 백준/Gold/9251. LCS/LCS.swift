
// LCS 최장공통부분 수열
// 부분 수열 중 가장 긴 것

// ACAYKP
// CAPCAK

// ACAK
// 최대 1000글자

// 최장공통부분 수열을 찾으려면, 결국 모든 지점에서 시작하는 부분을 비교해야한다. 이 개념
// 2^1000으로 시간 초과

// DP로 푼다고 하면
// A의 i번째, B의 j번째의 LCS를 저장

// DP[i][j] : A의 i번째, B의 j번째까지 인덱스까지의 LCS
// DP[i][j] = DP[i-1][j-1] + 1 (if A[i] == B[j])
// DP[i][j] = max(DP[i][j-1], DP[i-1][j] (if A[i] != B[j])

func solution(_ A: [Character], _ B: [Character]) -> Int {
    
    var DP = [[Int]](repeating: [Int](repeating: 0, count: B.count+1), count: A.count+1)
    
    DP[0][0] = 0
    DP[1][0] = 0
    DP[0][1] = 0
    
    for i in 1...A.count {
        for j in 1...B.count {
            
            if A[i-1] == B[j-1] {
                DP[i][j] = DP[i-1][j-1] + 1
            } else {
                DP[i][j] = max(DP[i-1][j], DP[i][j-1])
            }
        }
    }
    
    return DP[A.count][B.count]
}

let stringA = Array(readLine()!)
let stringB = Array(readLine()!)
print(solution(stringA, stringB))

