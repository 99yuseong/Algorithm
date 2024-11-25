// 시간 1초
// 메모리 512MB

// 정수 4를 1,2,3의 합으로 나타내는 방법 -> 7가지
// 정수 n을 1,2,3의 합으로 나타내는 방법

let T = Int(readLine()!)!

// n은 양의 정수, 1 <= n <= 10 1~10사이의 정수
for _ in 0..<T {
    let n = Int(readLine()!)!
    
    if n == 1 { print(1); continue }
    if n == 2 { print(2); continue }
    if n == 3 { print(4); continue }
    
    var D = Array(repeating: 0, count: n+1)
    D[1] = 1
    D[2] = 2
    D[3] = 4
    
    for i in 4...n {
        D[i] = D[i-1] + D[i-2] + D[i-3]
    }
    print(D[n])
}
