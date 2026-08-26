import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var answer = 0
    func dfs(_ num: Int, _ d: Int) {
        if d == numbers.count {
            if num == target { answer += 1 }
            return
        }
        
        dfs(num + numbers[d], d+1)
        dfs(num - numbers[d], d+1)
    }
    dfs(0, 0)
    
    return answer
}