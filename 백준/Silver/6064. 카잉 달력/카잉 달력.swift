// 1초
// 256MB

// M과 N보다 작거나 같은 2개의 자연수 x, y
// <1:1>
// <2:2>

// x < M이면 x' = x + 1 else x' = 1
// y < N이면 y' = y + 1 else y' = 1

// T개의 테스트 데이터
// 1 <= M,N <= 4만
// M N x y
// 종말까지 표현 안되면 -1

let T = Int(readLine()!)!

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    
    return gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a / gcd(a, b) * b
}

var ans = ""
out: for _ in 0..<T {
    let MNxy = readLine()!.split(separator: " ").map { Int($0)! }
    let M = MNxy[0]
    let N = MNxy[1]
    var x = MNxy[2]
    var y = MNxy[3]

    if x == M { x = 0 }
    if y == N { y = 0 }
    
    let l = lcm(M, N)
    
    for i in stride(from: x, through: l, by: M) {
        if i == 0 { continue }
        if i % N == y {
            ans += "\(i)\n"
            continue out
        }
    }
    ans += "-1\n"
}
print(ans)
