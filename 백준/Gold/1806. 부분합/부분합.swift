// 0.5초
// 128MB

// 10000이하 N개 자연수 수열
// 부분합이 S이상 가장 짧은 것

// N: 10~10만개
// S: 0~1억

let NS = readLine()!.split(separator: " ").map { Int($0)! }
let N = NS[0]
let S = NS[1]
var A = readLine()!.split(separator: " ").map { Int($0)! }

var en = 0
var tot = A[0]
var ans = Int.max

for st in 0..<N {
    while en < N && tot < S {
        en += 1
        if en != N { tot += A[en] }
    }
    if en == N { break }
    ans = min(ans, en - st + 1)
    tot -= A[st]
}

print(ans == Int.max ? 0 : ans)
