// N! /
import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

if K == 0 { print(1); exit(0) }

var ans = 1
for i in (N-K+1)...N {
    ans *= i
}
for i in 1...K {
    ans /= i
}

print(ans)
