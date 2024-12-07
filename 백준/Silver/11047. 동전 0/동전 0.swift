let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0] // 1 ~ 10
var K = NK[1] // 1 ~ 1억
var A = Array(repeating: 0, count: N)
for i in 0..<N {
    A[i] = Int(readLine()!)!
}

var ans = 0
for i in 0..<N {
    ans += K / A[N-1-i]
    K = K % A[N-1-i]
}
print(ans)
