// 2초
// 256MB

// M이상 N이하의 소수를 모두 출력
//1 ~ 100만

// 1, 100만
// 1000 * 백만번 -> 10억
// 에라토스테네스의 체 -> filter
// N 이하의 소수 배열 -> M 이상 filter

let MN = readLine()!.split(separator: " ").map { Int($0)! }
let M = MN[0]
let N = MN[1]

var isPrime = Array(repeating: true, count: N+1)
isPrime[1] = false

for i in 1...N {
    if isPrime[i] {
        var j = i + i
        while j <= N {
            isPrime[j] = false
            j += i
        }
    }
}

var ans = ""
for i in 1...N {
    if isPrime[i] && i >= M { ans += "\(i)\n" }
}
print(ans)

// 2의 배수 -> false
// 3의 배수 -> false
// 5의 배수 -> false

