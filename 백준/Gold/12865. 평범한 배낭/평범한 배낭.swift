// 배낭
// N개의 물건
// 각 물건은 W무게와 V의 가치
// 최대 K만큼의 무게
// return V의 합의 최댓값

// N: 1~100개 물건
// K: 1~10만의 무게
// W: 1~10만
// V: 0~1천

// 이번 물건을 선택하는 게 다음 물건의 선택에 영향을 준다.
// DP

// DP[i][j]: i번째 물건을 고려하면서 j의 무게를 견딜 수 있을 때 얻는 최대 가치

// DP[i][j] = max(DP[i-1][j-products[i][0]] + products[i][1], DP[i-1][j])
// 이때, j >= products[i][0]

// DP[0][k] = 0

func solution(_ k: Int, _ products: [[Int]]) -> Int {

    let n = products.count
    var DP = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)
    
    for i in 1...n {
        let product = products[i-1]
        let weight = product[0]
        let value = product[1]
        
        for j in 1...k {
            if j >= weight {
                DP[i][j] = max(DP[i-1][j-weight] + value, DP[i-1][j])
            } else {
                DP[i][j] = DP[i-1][j]
            }
        }
    }
    
    return DP[n][k]
}

let NK = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NK[0]
let K = NK[1]
var WVs: [[Int]] = []
for _ in 0..<N {
    let WV = readLine()!.split(separator: " ").map { Int(String($0))! }
    WVs.append(WV)
}
print(solution(K, WVs))
