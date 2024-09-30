import Foundation
let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let r = input[1]
let c = input[2]

func sol(_ n: Int, _ r: Int, _ c: Int) -> Int {
    if n == 0 { return 0 }
    let half = Int(pow(2.0, Double(n-1)))
    if r < half && c < half { return sol(n-1, r, c) }
    if r < half && c >= half { return half*half + sol(n-1, r, c-half) }
    if r >= half && c < half { return 2*half*half + sol(n-1, r-half, c) }
    return 3*half*half + sol(n-1, r-half, c-half)
}

print(sol(N, r, c))
