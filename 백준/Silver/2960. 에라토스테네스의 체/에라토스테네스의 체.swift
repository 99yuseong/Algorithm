// 1초
// 128 MB

// N보다 작거나 같은 모든 소수 알고리즘

// 2 ~ N까지 정수 적기
// 가장 작은수 P는 소수
// P를 지우고 P의 배수를 지운다.
// 수가 남았다면 다시 작은수 찾기

// N과 K가 주어졌을때, K번째 지우는 수
// 1 <= K < N, max(1, K) < N <= 1000
import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

var isPrime = Array(repeating: true, count: N+1)
var kth = Array(repeating: 0, count: N+1)
var curIdx = 1

for i in 2...N {
    if isPrime[i] {
        kth[curIdx] = i
        if curIdx == K { print(kth[curIdx]); exit(0) }
        curIdx += 1

        for j in stride(from: i*2, through: N, by: i) {
            if isPrime[j] {
                isPrime[j] = false
                kth[curIdx] = j
                if curIdx == K { print(kth[curIdx]); exit(0) }
                curIdx += 1
            }
        }
    }
}

