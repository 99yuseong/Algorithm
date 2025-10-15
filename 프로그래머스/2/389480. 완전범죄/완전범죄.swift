import Foundation

// 문제

// 도둑 A,B 물건 훔치면 흔적 남음 -> 흔적 최소화해야함

// A 도둑: n개의 흔적 = 붙잡힘
// B 도둑: m개의 흔적 = 붙잡힘

// 모두 붙잡히지 않으면서 모든 물건 훔칠때,
// return A 도둑 흔적의 최솟값

// 모두 붙잡힐 수 밖에 없다면
// return -1


// 조건

// info: 1~40
// 물건당 흔적: 1~3
// n: 1~120
// m: 1~120


// 풀이

// 완전탐색 -> A 또는 B가 40개의 물건 훔침 -> 2^40 경우의 수 (시간 초과)
// 그리디 -> 현재 선택이 이전/다음에 영향을 줄 수 있음 (최적해 놓칠 수 있음)
// DP -> a흔적과 b흔적 모든 케이스를 저장하면서 확장

// D[i][b] = a : i번째 물건을 훔치고 B의 흔적이 b일때, A의 흔적 최솟값 a

// 1. A가 물건을 훔쳤을때,
// D[i][j] = min(D[i][j], D[i-1][j] + a)

// 2. B가 물건을 훔쳤을때,
// D[i][j+b] = min(D[i][j+b], D[i-1][j]) 단, j+b < m

// D[0][0] = a 
// D[0][b] = 0 단, b < m

func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    
    let MAXB = 120
    let INF = 1_000_000_000
    
    var D = [[Int]](repeating: [Int](repeating: INF, count: MAXB+1), count: info.count)
    
    let a = info[0][0]
    let b = info[0][1]
    
    // a가 훔칠 경우
    if a < n {
        D[0][0] = a
    }
    
    // b가 훔칠 경우
    if b < m {
        D[0][b] = 0
    } 
    
    for i in 1..<info.count {
        let a = info[i][0]
        let b = info[i][1]
        
        for j in 0...MAXB {
            if D[i-1][j] == INF { continue }
            
            // a를 선택
            if D[i-1][j] + a < n {
                D[i][j] = min(D[i][j], D[i-1][j] + a)    
            }
             
            // b를 선택
            if j + b < m {
                D[i][j+b] = min(D[i][j+b], D[i-1][j])    
            }
        }
    }
    
    var ans = INF
    for j in 0..<m {
        ans = min(ans, D[info.count-1][j])
    }
    
    return ans == INF ? -1 : ans
}