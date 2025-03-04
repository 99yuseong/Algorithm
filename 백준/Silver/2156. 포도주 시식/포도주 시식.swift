// 포도주가 일렬
// 선택 - 모두 마시고 원래 위치에 두기
// 연속해서 3잔을 마실수는 없음

// 1~n까지 n개의 포도주잔
// 각 포도주의 양
// 가장 많은 포도주?
func solution(_ N: Int, _ S: [Int]) -> Int {
    // N: 1~1만
    // podo: 0~1000의 수, -> 최대 1000만
    // o x o
    // x o o
    //
    // D[i]: i번째 술을 마셨을 때 최대 양
    // D[i] = max(D[i-2]+S[i], D[i-3]+S[i-1]+S[i], D[i-1])
    // D[1] = S[i]
    // D[2] = S[1] + S[2]
    // D[3] = S[1] + S[3] || S[2] + S[3]
    if N == 1 { return S[0] }
    if N == 2 { return S[0] + S[1] }
    if N == 3 { return max(S[0]+S[2], S[1]+S[2], S[0]+S[1]) }
    
    var D = Array(repeating: 0, count: N)
    D[0] = S[0]
    D[1] = S[0]+S[1]
    D[2] = max(S[0]+S[2], S[1]+S[2], D[1])
    for i in 3..<S.count {
        D[i] = max(D[i-2]+S[i], D[i-3]+S[i-1]+S[i], D[i-1])
    }
    
    return D[N-1]
}

let N = Int(readLine()!)!
var S: [Int] = []
for _ in 0..<N {
    S.append(Int(readLine()!)!)
}
print(solution(N, S))
