// 1 ~ N개의 카드가 포합된 카드팩

// 최대한 많이 지불해서 N개를 구매
// 장당 가격이 높은 순으로 구매? 근데 개수가 안맞을 수도

// 딱 장수에 맞게 구매해야한다.
// 그리디는 안되는 거고 > 이전 구매가 다음 구매에 영향

// 현재 k장 > N-k 팩중 1개를 살 수 있다.

// DFS 아니면 DP

// DP로 푼다고 하면
// D[i]: i장을 구매하기 위해 지불해야하는 금액의 최댓값
// D[i] = for 1...k - max(D[i-k] + D[k]) and p[i-1]
// D[1] = p[0]

func solution(_ n: Int, _ p: [Int]) -> Int {
    
    var D = [0] + p
    
    for i in 1...n { // 1000 * 1000
        for k in 1...i {
            D[i] = max(D[i], D[k] + D[i-k])
        }
    }
    
    return D[n]
}

let N = Int(readLine()!)!
let P = readLine()!.split(separator: " ").map { Int(String($0))! }

print(solution(N, P))