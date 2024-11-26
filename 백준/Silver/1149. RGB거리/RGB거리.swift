// 시간 0.5초
// 메모리 128MB

// 집이 N개
// 1번집 ~ N번집 순서대로

// 빨, 초, 파 중 하나의 색으로 칠해야함
// 1번집 != 2번집 (시작 2집 달라야함)
// N번집은 N-1번집과 같지 않아야함 (맨끝 2집 달라야함)
// i번집 2<=i<=N-1은 i-1, i+1과 달라야함
// 인접한 집과는 색이 달라야함

// 2 <= N <= 1000
// 칠하는 비용 R G B
// 비용은 1~999
// 비용의 최솟값

// R: 0, G: 1, B: 2
// 1. dp[N][0] = min(dp[N-1][1], dp[N-1][2]) + F[N][0]
// 2. dp[N][1] = min(dp[N-1][0], dp[N-1][2]) + F[N][1]
// 3. dp[N][2] = min(dp[N-1][0], dp[N-1][1]) + F[N][2]
// min(dp[N][0], dp[N][1], dp[N][2])
// F[ [R,G,B] ]
// dp[ [R,G,B] ]

// dp[2][0] = min(F[1][1], F[1][2]) + F[2][0]
// dp[2][1] = min(F[1][0], F[1][2]) + F[2][1]
// dp[2][2] = min(F[1][0], F[1][1]) + F[2][2]

let N = Int(readLine()!)!
var F = Array(repeating: Array(repeating: 0, count: 3), count: N+1)
var D = Array(repeating: Array(repeating: 0, count: 3), count: N+1)

for i in 1...N {
    F[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

D[1][0] = F[1][0]
D[1][1] = F[1][1]
D[1][2] = F[1][2]

for i in 2...N {
    D[i][0] = min(D[i-1][1], D[i-1][2]) + F[i][0]
    D[i][1] = min(D[i-1][0], D[i-1][2]) + F[i][1]
    D[i][2] = min(D[i-1][0], D[i-1][1]) + F[i][2]
}
print(min(D[N][0], D[N][1], D[N][2]))
