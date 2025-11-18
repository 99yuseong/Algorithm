// 자연수 N - 제곱수의 합으로 표현 -> 최소 항의 개수

// [제한사항]
// N: 1~10만

// DP[i]: i를 제곱수의 합으로 나타낼때 항의 최소 개수
// DP[i] = DP[i-root_i*root_i] + 1

// 항상 가장 가장 큰 제곱수로 한다고 해서 가장 작아지는 건 아니다.
// 다 해봐야한다.

// DP[i] = 2 ~ root_i까지 제곱수로 구성

// DP[1] = 1
import Foundation

func solution(_ N: Int) -> Int {
    
    if N == 1 { return 1 }
    
    var DP = [Int](repeating: Int.max, count: N+1)
    
    DP[0] = 0
    DP[1] = 1
    
    for i in 2...N {
        for j in 1...Int(sqrt(Double(i))) {
            DP[i] = min(DP[i], DP[i-j*j] + 1)
        }
    }
    
    return DP[N]
}

let N = Int(readLine()!)!
print(solution(N))
