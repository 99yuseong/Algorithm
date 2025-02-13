import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
// 자연수를 더하거나 빼서 타겟 넘머
// 방법의 수를 리턴

// numbers: 2~20개
// 1~50 자연수
// 타겟 1~5000

// [1, -1]
// 완전 탐색
// 2^20 -> 100만
    
    func bfs(index: Int, cur: Int) -> Int {
        if index == numbers.count {
            return cur == target ? 1 : 0
        } 
        
        let plus = bfs(index: index+1, cur: cur + numbers[index])
        let minus = bfs(index: index+1, cur: cur - numbers[index])
        
        return plus + minus
    }   
    
    return bfs(index: 0, cur: 0)
}
