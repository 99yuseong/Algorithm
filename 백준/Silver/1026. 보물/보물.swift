// 배열 A와 배열 B의 각 원소의 곱의 합이 최소가 되도록
// 직관적으로 A.sort, B.sort.reversed의 곱의 합

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }
var B = readLine()!.split(separator: " ").map { Int($0)! }

A.sort()
B.sort()

var ans = 0
for i in 0..<N {
    ans += A[i] * B[N-1-i]
}
print(ans)