import Foundation

// problems -> maxAlp와 maxCop를 찾고, alp와 cop가 해당 값에 도달하기 위한 최소시간 K를 리턴

// 현재 경우의 수는 N+2가지
// 1. 알고리즘 공부
// 2. 코딩 공부
// N. N개 중 1개의 문제 풀이

// 완전 탐색으로 N+2개의 경우를 모두 확인하고 최솟값을 찾으려면
// O((N+2)^K) = O(102^150)의 시간복잡도 - 시간초과

// 이분탐색? DP? 최소 시간이라. -> 최단 경로 문제와도 유사

// D[i][j] = K : alp=i, cop=j에 도달하는 데 걸리는 최소시간

// D[i+1][j] = min(D[i+1][j], D[i][j]+1)
// D[i][j+1] = min(D[i][j+1], D[i][j]+1)
// D[i+alp_rwd][j+cop_rwd] = min(D[i+alp_rwd][j+cop_rwd], D[i][j]+cost) 
// (i >= alp_req, j >= cop_req)


func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    
    var maxAlp = 0
    var maxCop = 0
    
    for p in problems {
        maxAlp = max(p[0], maxAlp)
        maxCop = max(p[1], maxCop)
    }
    
    var D = [[Int]](repeating: [Int](repeating: 100000, count: maxCop+1), count: maxAlp+1)
    
    var startAlp = min(alp, maxAlp)
    var startCop = min(cop, maxCop)
    
    D[startAlp][startCop] = 0
    
    for i in startAlp...maxAlp {
        for j in startCop...maxCop {
            
            if i+1 <= maxAlp {
                D[i+1][j] = min(D[i+1][j], D[i][j]+1)
            }
            
            if j+1 <= maxCop {
                D[i][j+1] = min(D[i][j+1], D[i][j]+1)
            }
            
            for p in problems {
                let alp_req = p[0]
                let cop_req = p[1]
                
                guard i >= alp_req && j >= cop_req else { continue }
                
                let alp_rwd = p[2]
                let cop_rwd = p[3]
                let cost = p[4]
                
                // i+alp_rwd가 maxAlp를 초과하는 경우 -> 조건은 만족하지만, DP 배열은 초과함
                // j+cop_rwd가 maxCop를 초과하는 경우 -> 조건은 만족하지만, DP 배열은 초과함
                
                // 즉, 얼마나 넘치는 지는 몰라도 되고, max를 넘었다면 처리하면 된다.
                
                let nextAlp = min(i+alp_rwd, maxAlp)
                let nextCop = min(j+cop_rwd, maxCop)
                
                D[nextAlp][nextCop] = min(D[nextAlp][nextCop], D[i][j]+cost)
            }
        }
    }
    
    return D[maxAlp][maxCop]
}