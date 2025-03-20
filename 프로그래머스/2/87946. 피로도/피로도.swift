import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    // 던전 줄 세우기, && 탐험
    var piro = k
    var explore = 0
    var isUsed = Array(repeating: false, count: k)
    
    func permu(_ n: Int, _ curPiro: Int, _ curExplore: Int) {
        if n == dungeons.count {
            explore = curExplore
            return
        }
        
        for i in 0..<dungeons.count {
            if !isUsed[i] {
                isUsed[i] = true
                if curPiro >= dungeons[i][0] {
                    permu(n+1, curPiro - dungeons[i][1], curExplore+1)
                } else {
                    explore = max(explore, curExplore)
                }
                isUsed[i] = false
            } 
        }
    }  
    permu(0, k, 0)
    
    return explore
}

// 한번씩 탐험 던전
// 현재 피로도 k
// 각 던전별 최소 피로도, 소모피로도
// 탐험할 수 있는 최대 던전 수

// k: 1~5000
// 던전은 1~8개
// 최소 피로도 >= 소모 피로도

// 8개 다 돌아봐라? 이건가?
// 8! -> 대강 6천 언저리 / 그리디 필요 X, 