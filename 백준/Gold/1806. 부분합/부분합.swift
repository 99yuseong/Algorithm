let NS = readLine()!.split(separator: " ").map { Int($0)! }
let N = NS[0]
let S = NS[1]
var A = readLine()!.split(separator: " ").map { Int($0)! }

var en = 0
var tot = A[0] // st ~ en까지 합
var cnt = Int.max

for st in 0..<N {
    while tot < S {
        en += 1
        if en < N { tot += A[en] }
        else { break }
    }
    if en == N { break } // 이제 S보다 무조건 작다.
    
    // 이제 S에 도달했다.
    cnt = min(cnt, en - st + 1) // 누적합에 쓰이는 원소 개수 최솟값 업데이트
    tot -= A[st] // 이제 앞으로 전진
}

// O(2N)에 누적합 확인
// 확인했는데 cnt가 업데이트 안됐다? -> 누적합 불가능
print(cnt == Int.max ? 0 : cnt)

// TestCase
// 누적합으로 11을 만들 수 없는 경우
// 10 11
// 1 1 1 1 1 1 1 1 1 1
// ----
// 0

