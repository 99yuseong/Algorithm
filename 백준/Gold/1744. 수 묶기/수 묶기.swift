// 길이가 N인 수열
// 묶을 땐 서로 곱한 후 더한다.

// 단 한 번만 묶거나 묶지 않거나
// 합이 최대

// 1. 가장 큰 수 끼리 곱할 것
// 2. 음수 큰 수 끼리 곱할 것

let N = Int(readLine()!)! // 1~49개 수
var A: [Int] = [] // -1000 ~ 1000
var B: [Int] = []
var ans = 0

for _ in 0..<N {
    let n = Int(readLine()!)!
    if n > 1 {
        A.append(n)
    } else if n < 1 {
        B.append(n)
    } else {
        ans += n
    }
}

A.sort() // 양수
B.sort() // 음수 + 0

// 2N개
// A[2N] + A[2N-1]
// 2N + 1개
// A[2N+1] + A[2N]

if A.count < 2 {
    ans += A.reduce(0, +)
} else {
    if A.count % 2 == 0 {
        for i in 0..<A.count/2 {
            ans += A[2*i] * A[2*i + 1]
        }
    } else {
        ans += A.first!
        for i in 0..<A.count/2 {
            ans += A[2*i + 1] * A[2*i + 2]
        }
    }

}

if B.count < 2 {
    ans += B.reduce(0, +)
} else {
    if B.count % 2 == 0 {
        for i in 0..<B.count/2 {
            ans += B[2*i] * B[2*i + 1]
        }
    } else {
        ans += B.last!
        for i in 0..<B.count/2 {
            ans += B[2*i] * B[2*i + 1]
        }
    }

}

print(ans)
