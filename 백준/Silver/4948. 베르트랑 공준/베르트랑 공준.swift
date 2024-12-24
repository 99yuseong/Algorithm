// i보다 작은 소수의 개수 배열
var prime = Array(repeating: 1, count: 123456*2+1)
prime[0] = 0
prime[1] = 0

for i in 2...123456*2 {
    if prime[i] == 1 {
        for j in stride(from: i*2, through: 123456*2, by: i) {
            prime[j] = 0
        }
    }
}

var ans = ""
while true {
    let N = Int(readLine()!)!
    
    if N == 0 { break }
    
    ans += "\(prime[N+1...2*N].reduce(0, +))\n"
}
print(ans)
