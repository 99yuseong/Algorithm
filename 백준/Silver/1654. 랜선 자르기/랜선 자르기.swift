// 2초
// 128MB

// K개 랜선 길이 제각각
// N개의 같은 길이의 랜선으로

// 무조건 만들 수 있음
// N개보다 많이 만드는 것도 포함

// K개 -> N개 만들기
// K: 1~1만
// N: 1~100만
// K <= N

// 1 ~ 2^31 -1
// 이분탐색으로 길이를 탐색 O(32lg(2))

let KN = readLine()!.split(separator: " ").map { Int($0)! }
let K = KN[0]
let N = KN[1]
var A: [Int] = []
for _ in 0..<K { A.append(Int(readLine()!)!) }

var min = 1
var max = A.max()! // O(K), 최대 2^31-1, Swift.Int에선 넘치지 않는다.
    
while min < max {
    let mid = (min + max + 1) / 2
    
    if canMakeN(len: mid) {
        min = mid // 조건 충족해
    } else {
        max = mid - 1 // 너무 길어
    }
}
print(min)

func canMakeN(len: Int) -> Bool {
    A.map { $0 / len }.reduce(0, +) >= N
}
