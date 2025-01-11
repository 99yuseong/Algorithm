// 1초
// 32MB ??????? 400만개 Int(64) 배열?

// 길이가 N인 수열
// 1개 이상의 연속한 수를 뽑았을때, 같은 수가 여러번 등장하지 않는 경우의 수

// N: 1~10만
// 정수 1~10만 이하

// 수열을 줄 텐데 몇 개까지 중복 없이 셀 수 있나?
// st = 0, en = 0, cnt = 1
// st = 0, 중복을 확인하고 어디까지 전진할 수 있나?
// Set(A[0]), if !set.contains(A[en]), en++
// set에 A[en]이 포함 안할 때까지 전진
// 만약 포함한다면 정지
// cnt += en - st
// set.remove(where { $0 == st })
// st++

// 여기서는 en이 끝까지 전진했다는 건 -> 이후 중복이 하나도 없다.
// 1 + 2 + ... + st = st(st+1)/2 break
// O(2N) 안에 해결이 가능하다.

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }

var st = 0
var en = 0
var cnt = 0
var set = Set<Int>()

while true {
    while en < N && !set.contains(A[en]) {
        set.insert(A[en])
        en += 1
    }
    
    // 이후 중복이 하나도 없다. k = en - st.
    // 1 + 2 + ... + k개의 수열 가능
    if en == N {
        let k = en - st
        cnt += k * (k+1) / 2
        break
    }
    
    // 여기서는 st...en으로 만들 수 있는 부분 수열 개수
    cnt += en - st
    set.remove(A[st])
    st += 1
}
print(cnt)

