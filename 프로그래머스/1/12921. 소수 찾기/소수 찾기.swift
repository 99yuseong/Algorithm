// 1 ~ n 사이의 소수의 개수
// n: 2 ~ 1백만

// 소수는 sqrt보다 작은 수 중 나누어 떨어지지 않는 수

// 에라토스테네스의 체

func solution(_ n:Int) -> Int {
    
    var nums = [Bool](repeating: true, count: n+1)
    
    nums[0] = false
    nums[1] = false
    
    var i = 2
    while i * i <= n {
        var j = i + i
        
        while j <= n {
            nums[j] = false     
            j += i
        }
        i += 1
    }
    
    return nums.filter { $0 }.count
}