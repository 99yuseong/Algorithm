// ATM 1대
// N명의 사람들이 줄
// i번째 사람 인출 -> P_i

// P1 = 3
// P2 = 1
// P3 = 4
// P4 = 3
// P5 = 2

// 누적합?

// 필요한 시간의 합의 최솟값

let N = Int(readLine()!)! // N 사람 수 1~1000
var P = readLine()!.split(separator: " ").map { Int($0)! } // P 1~1000시간

P.sort()
// 1초
var ans = 0
for i in 0..<N {
    ans += P[i] * (N-i)
}
print(ans)
