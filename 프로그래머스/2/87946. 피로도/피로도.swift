// 피로도 0 이상 정수 == 체력
// 최소 피로도, 소모 피로도

// 현재 피로도 k, [최소, 소모]
// 탐험할 수 있는 최대 던전 수

// k: 1~5000
// d: 8개 이하, [최소, 소모] -> 같을 수도 있다.
// 최소 >= 소모
// 최소, 소모: 1~1000

// 그리디 -> 최소 피로도 높을 수록, 소모 피로도 낮을 수록 정렬
// 근데, 최소 피로도가 높다는 건 소모피로도도 같이 높을 수 있다. -> 그리디 안됨

// 8개면 그냥 줄세워보고 확인해봐라.
// 8! ~~ 500정도

// maxCnt = 0
// var k를 기준으로, 8개 다 돌았거나, 0이 된 경우 체크
// visited
// dfs로 8개 다 돌았을 때 체크

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    var maxCnt = 0
    var visited = Array(repeating: false, count: dungeons.count)
    
    func dfs(_ k: Int, _ n: Int, _ cnt: Int) {
        
        if n == dungeons.count {
            maxCnt = max(maxCnt, cnt)
            return
        }
        
        for i in 0..<dungeons.count {
            if !visited[i] {
                visited[i] = true
                if k >= dungeons[i][0] {
                    dfs(k-dungeons[i][1], n+1, cnt+1)
                } else {
                    dfs(k, n+1, cnt)
                }
                visited[i] = false
            }
        }
    }
    dfs(k, 0, 0)
    
    return maxCnt
}