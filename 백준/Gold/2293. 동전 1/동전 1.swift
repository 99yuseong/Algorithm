// n가지 종류의 동전
// 가치의 합이 k원이 되도록 하는 경우의 수

// n: 1~100개
// value: 1~100000원
// k: 1~10000원
// 경우의 수: 2^31

// n: [1,2,5], k: 10

// D[10] = D[10-1] + D[10-2] + D[10-5]
// D[k] = D[k-a1] + ... + D[k-an] for coins = [a1, a2, ... an]
// D[a1] = 1
import Foundation

func solution(_ coins: [Int], _ k: Int) -> Int {
    
    var dp = Array(repeating: 0, count: k + 1)
    dp[0] = 1

    for i in 0..<n{
        for j in stride(from: coins[i], through: k, by: 1){
            
            if dp[j] + dp[j - coins[i]] >= Int(pow(2.0, 31.0)){
                dp[j] = 0
            }else{
                dp[j] += dp[j - coins[i]]
            }
        }
    }
    
    return dp[k]
}

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var coins: [Int] = []
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}
print(solution(coins, k))
