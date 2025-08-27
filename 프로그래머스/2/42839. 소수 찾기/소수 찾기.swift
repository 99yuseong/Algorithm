// 종이조각 - 한 자리수
// 소수

// 1~7자리 수 -> 조합해서 소수를 만들어라
// 0~9사이 숫자

// 1. 순열을 만들어라
    // String -> [Character]
    // loop를 돌면서 2,3 실행
// 2. 소수인지 판별해라
// 3. 순열의 값이 소수인지 개수를 세라
// 4. 개수 값을 리턴해라

// [리턴] : 만들 수 있는 소수는 몇개인가

import Foundation

func solution(_ numbers:String) -> Int {
    
    
    let n = numbers.count
    let arr = Array(numbers)
    var visited = Array(repeating: false, count: n)
    var primeSet = Set<Int>()
    
    func dfs(_ cur: String) {
        if let num = Int(cur) {
            if isPrime(num) {
                primeSet.insert(num)
            }
        }
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                dfs(cur + String(arr[i]))
                visited[i] = false
            }
        }
    }
    
    dfs("") 
    
    return primeSet.count
}

func isPrime(_ n: Int) -> Bool {
    
    if n < 2 { return false }
    if n < 4 { return true } 
    for i in 2...Int(sqrt(Double(n))) {
        if (n % i == 0) { return false }
    }
    
    return true
}