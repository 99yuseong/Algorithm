// 2초
// 128MB

// 무한 수열 A
// A0 = 1
// NPQ가 주어질때, AN을 구하라

// N: 0~10^12 1조
// P,Q: 1~10억

let NPQ = readLine()!.split(separator: " ").map { Int($0)! }
let N = NPQ[0]
let P = NPQ[1]
let Q = NPQ[2]

// D[i]: i번째 수열
// D[i] = D[i/P] + D[i/Q]

var D = [Int:Int]()
D[0] = 1

func sol(_ k: Int) -> Int {
    if k == 0 { return 1 }
    if let val = D[k] { return val }
    
    D[k] = sol(k/P) + sol(k/Q)
    
    return D[k]!
}

print(sol(N))
