// 적절히 더하거나 빼라

// target을 만드는 방법의 개수

// N: 2~20개
// 1~50의 자연수 -> 50 * 20 다더하면 1000
// target: 1~1000

// 0 +-a +-b
// dfs -> N개를 모두 했을때 target이면 cnt++

// dfs : O(2^20) = O(1024 * 1024)

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    let N = numbers.count
    var cnt = 0
    
    func dfs(_ k: Int, _ cur: Int) {
        
        if k == N {
            cnt += cur == target ? 1 : 0
            return
        }
        
        dfs(k+1, cur+numbers[k])
        dfs(k+1, cur-numbers[k])
    }
    dfs(0, 0)
    
    return cnt
}