// 1초
// 1024 MB

// 같은 원소가 여러개 들어있는 수열 No
// 같은 원소가 K개 이하로 들어있는 최장 연속 부분 수열의 길이

// 투포인터의 연속 부분 수열!

// 1~10만 사이의 정수로 구성된
// 길이 N인 수열
// 같은 정수를 K개 이하만 포함할 수 있도록

// 조건
// N: 1~20만 -> O(N), O(NlgN)
// K: 1~100개 중복 가능
// ai: 1~10만 사이 수

// 투포인터 연속 부분 배열 -> O(2N)에 해결 가능
// st, en = 0

// 10만개의 Int배열 -> 80MB
// var arr: 정수 중복 여부 카운트 배열

// set에 담아가면서 중복 시 cnt++, arr[A[en]]++
// en < N, arr[A[en]] < K

// 멈추면 en == N이거나

// en - st개의 길이 최댓값 업데이트
// arr[st] -= 1
// st 전진

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
let A = readLine()!.split(separator: " ").map { Int($0)! }

var arr = Array(repeating: 0, count: 200001)
var st = 0
var en = 0
var ans = -1

while true {
    while en < N && (arr[A[en]] < K) {
        arr[A[en]] += 1
        en += 1
    }
    
    // 이제 최장 수열이다.
    if en == N {
        ans = max(ans, en-st)
        break
    }
    
    // 같은 원소 K개가 들어있다.
    ans = max(ans, en-st)
    arr[A[st]] -= 1
    st += 1
}
print(ans)

// TestCase
// 1 1
// 1
// --
// 1
