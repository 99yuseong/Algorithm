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
    let arr = Array(numbers).map { String($0) }
    var selected: [String] = []
    var isUsed: [Bool] = Array(repeating: false, count: arr.count)
    var primeCnt = 0
    var primeSet = Set<Int>()
    
    func permute(_ k: Int) {
        
        if k == n {
            let num = Int(selected.joined())!
            
            if isPrime(num) && !primeSet.contains(num) {
                primeCnt += 1
                primeSet.insert(num)
            }
            
            return
        }
        
        for i in 0..<n {
            if !isUsed[i] {
                isUsed[i] = true
                selected.append(arr[i])
                permute(k+1)
                selected.removeLast()
                isUsed[i] = false
            } else {
                permute(k+1)
            }
        }
    }
    permute(0)
    
    return primeCnt
}

func isPrime(_ v: Int) -> Bool {
    
    if v < 2 { return false }
    
    if (v < 4) { return v != 1 }
    
    for i in 2...Int(sqrt(Double(v))) {
        if (v % i == 0) { return false }
    }
    
    return true
}