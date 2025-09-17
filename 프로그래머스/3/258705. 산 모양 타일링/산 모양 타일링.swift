import Foundation

// 2N+1개 -> N N+1

// N = 4
// 총 9개

// 정삼각형 / 마름모

// n과 tops
// -> 경우의 수 % 10007 = 나머지를 리턴

// N: 1~10만
// 

// D[2i+1] : i번째 top까지 경우의 수

// tops[i-1] == 1
    // D[2i] = D[2i-2] * 3 + D[2i-1] * 2
    // D[2i+1] = D[2i-2] * 4 + D[2i-3] * 3

// tops[i-1] == 0
    // D[2i] = D[2i-2] * 2 + D[2i-1] * 1
    // D[2i+1] = D[2i-2] * 3 + D[2i-3] * 2

// D[5] = D[2] * 4 + D[1] * 3 = 2 * 4 + 1 * 3

func solution(_ n:Int, _ tops:[Int]) -> Int {
    
    let MOD = 10007
    var D = [Int](repeating: 0, count: 2*n + 2)
    
    D[1] = 1
    D[2] = tops[0] == 0 ? 2 : 3
    D[3] = tops[0] == 0 ? 3 : 4
    
    // n = 2 > 
        // D[4] > D[2], D[1]
        // D[5] > D[2], D[1]
    // n = 3 
        // D[6] > D[4], D[3]
        // D[7] > D[4], D[3]
    // n = 4 > D[9] > D[6], D[5]
    
    for i in 2...n {
        if tops[i-1] == 1 {
            D[2*i]   = (D[2*i-2] * 3 + D[2*i-3] * 2) % MOD
            D[2*i+1] = (D[2*i-2] * 4 + D[2*i-3] * 3) % MOD
        } else {
            D[2*i]   = (D[2*i-2] * 2 + D[2*i-3] * 1) % MOD
            D[2*i+1] = (D[2*i-2] * 3 + D[2*i-3] * 2) % MOD
        }
    }
    
    return D[2*n+1]
}