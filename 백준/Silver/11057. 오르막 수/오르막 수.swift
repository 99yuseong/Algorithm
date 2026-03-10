// 오르막 수
// 수의 자리가 오름차순
import Foundation

func solution(_ n: Int) -> Int {

    // 결론적으로 길이가 n이면 되는거고
    // 이전에 어떤수를 선택했는지 알면 개수가 정해지는 거고
    
    // D[i]: i번째에 선택한 수
    // D[i] = D[i-1] 
    
    // 순서는 알아서 정해짐
    // 중복 조합 > 시간초과
    
    // D[i][j]: i번째에 j를 선택했을때의 가능한 경우의 수 / MOD
    // D[i][j] = D[i-1][p1] + ... D[i-1][pk] where j <= p1 <= pk <= 9
    // D[0][k] = 1
    
    let MOD = 10007  
    var D = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 1000)

    for k in 0...9 {
        D[0][k] = 1
    }
    
    for i in 1..<1000 { // 1000 * 10 * 10
        for j in 0...9 {
            for k in j...9 {
                D[i][j] = (D[i][j] + D[i-1][k]) % MOD
            }
        }
    }
    
    return D[n-1].reduce(0, +) % MOD
}

let N = Int(readLine()!)! // 1~1000
print(solution(N))