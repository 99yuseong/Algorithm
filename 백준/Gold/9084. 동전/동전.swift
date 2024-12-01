// 시간제한 1초
// 메모리 128MB

// 1 5 10 50 100 500
// 금액을 만드는 모든 방법

// T: 테스트 케이스 1~10 -> 최악은 0.1초 만에 되게하라
// N: 1~20
// N가지 동전이 오름차순
// M: 금액 1~10000

// M을 N의 숫자로 나누는 방법

// D[i]: 주어진 동전으로 i원을 만들 수 있는 모든 방법
// D[i][k] = i/k if i % k == 0
// D[i][k] = i/k + D[i%k][j]
// D[M]: 주어진 동전으로 M원을 만들 수 있는 모든 방법

let T = Int(readLine()!)!
for _ in 0..<T {
    let N = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int($0)! }
    let M = Int(readLine()!)!
    var D = Array(repeating: 0, count: M+1)
    
    D[0] = 1
    
    for coin in coins {
        for money in 1...M {
            if money >= coin {
                D[money] += D[money-coin]
            }
        }
    }

    print(D[M])
}
