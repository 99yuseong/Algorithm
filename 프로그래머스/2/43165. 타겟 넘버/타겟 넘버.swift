import Foundation

// n개의 음이 아닌 정수
// 적절히 더하거나 빼서

// 방법의 경우의 수를 구해라

// 2~20개 숫자

// 1~50사이
// 타겟은 1~1000


// 2^20 > 100만 경우의 수

// 순서를 바꾸지 않고 - 더하거나 뺀다.



func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var cnt = 0
    var cur = 0
    
    func dfs(_ k: Int) {
        
        if k == numbers.count {
            if target == cur { cnt += 1 }
            return
        }
        
        cur += numbers[k]
        dfs(k+1)
        cur -= numbers[k]
        
        cur -= numbers[k]
        dfs(k+1)
        cur += numbers[k]
    }    
    dfs(0)
    
    return cnt
}