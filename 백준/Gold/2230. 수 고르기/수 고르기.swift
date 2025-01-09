// 2초
// 128MB

// N개의 정수 수열 A (무작위 숫자들)
// 차이가 M이상이면서 제일 작은 경우

// 1. A 정렬
// 2. for 문으로 N개의 수를 돌면서
// 2-1. 이분탐색 (x + M) 기준으로 탐색 lowerBound

// M이 주어지니까

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0] // 1~10만 -> O(NlgN)
let M = NM[1] // 0~20억
var A: [Int] = []
for _ in 0..<N { A.append(Int(readLine()!)!) }
A.sort() // O(NlgN)

var ans = Int.max
var en = 0

for st in 0..<N {
    while en < N && A[en] - A[st] < M { en += 1 }
    if en == N { break }
    ans = min(ans, A[en] - A[st])
}

print(ans)
