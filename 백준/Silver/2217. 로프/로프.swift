// N개의 로프 1~10만
// k개의 로프 중량이 w -> w/k만큼의 중량이 분배

// 임의로 몇개만 사용가능

let N = Int(readLine()!)!
var Ws: [Int] = [] // 1~10000 자연수
for _ in 0..<N {
    Ws.append(Int(readLine()!)!)
}
Ws.sort()

var ans = 0
for i in 0..<N {
    ans = max(ans, Ws[i] * (N-i))
}
print(ans)