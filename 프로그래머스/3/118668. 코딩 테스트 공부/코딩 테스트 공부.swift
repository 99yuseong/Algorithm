import Foundation

// D[i][j] = K, 알고력 i, 코딩력 j에 도달하는데 걸리는 최소시간 K

// D[i+1][j] = min(D[i+1][j], D[i][j] + 1)
// D[i][j+1] = min(D[i][j+1], D[i][j] + 1)
// D[i+alp_rwd][j+cop_rwd] = min(dp[i+alp_rwd][j+cop_rwd], dp[i][j]+cost) i>= alp_req, j >= cop_req

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    
    var MAX_ALP = 0
    var MAX_COP = 0
    
    for problem in problems {
        MAX_ALP = max(problem[0], MAX_ALP)
        MAX_COP = max(problem[1], MAX_COP)
    }
    
    var D = [[Int]](repeating: [Int](repeating: 200, count: MAX_COP+1), count: MAX_ALP+1)
    
    var alp = min(alp, MAX_ALP)
    var cop = min(cop, MAX_COP)
    
    D[alp][cop] = 0
    
    for i in alp...MAX_ALP {
        for j in cop...MAX_COP {
            
            if i+1 <= MAX_ALP {
                D[i+1][j] = min(D[i+1][j], D[i][j] + 1)    
            }
            
            if j+1 <= MAX_COP {
                D[i][j+1] = min(D[i][j+1], D[i][j] + 1)
            }
            
            for problem in problems {
                
                let alp_req = problem[0]
                let cop_req = problem[1]
                let alp_rwd = problem[2]
                let cop_rwd = problem[3]
                let cost = problem[4]
                
                guard i >= alp_req && j >= cop_req else { continue }
                
                let next_alp = min(MAX_ALP, i+alp_rwd)
                let next_cop = min(MAX_COP, j+cop_rwd)
                
                D[next_alp][next_cop] = min(D[next_alp][next_cop], D[i][j]+cost)
            }
        }
    }
    
    return D[MAX_ALP][MAX_COP]
}