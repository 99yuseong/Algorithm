// 빨리누른 학생 대기목록
// 대기열 -> 수강신청시 맨뒤로
// 비활성화 -> 순서대로 수강신청 / 무시

// K: 1~10만명 정원
// L: 1~10만 대기목록의 길이 -> O(N) / O(NlgN)
// 학번은 8자리 숫자

// 순서가 있는 Set
// Set() 순서가 없는데...
// Dict

// Dict: [Int:Int] [학번:카운트]

let KL = readLine()!.split(separator: " ").map { Int($0)! }
let K = KL[0]
let L = KL[1]
var A: [String] = []
var D: [String:Int] = [:]

for _ in 0..<L {
    let input = readLine()!
    A.append(input)
    if D[input] != nil { D[input] = D[input]! + 1 }
    else { D[input] = 1 }
}

var ans = ""
var cnt = 0
var idx = 0

while cnt < K && idx < L {
    if D[A[idx]] == 1 {
        ans += "\(A[idx])\n"
        cnt += 1
    } else {
        D[A[idx]] = D[A[idx]]! - 1
    }
    idx += 1
}
print(ans)
