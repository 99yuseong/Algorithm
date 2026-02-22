import Foundation

// 종이 조각으로 소수
// 7자리 10장

// 10 P 7 순열 -> 10 * 9 * 8 = 720개 경우의 수

func solution(_ numbers:String) -> Int {
    
    var nums: Set<Int> = []
    
    for i in 1...numbers.count { // 7
        for num in permu(i, numbers) { // 10 * 9 * 8 * 7 * 6 * 5 * 4
            nums.insert(num)
        }
    }
    
    print(nums)
    
    return nums.filter { isPrime($0) }.count
}

// 1. 경우의 수 뽑고,
// 2. 소수 여부 확인

func permu(_ n: Int, _ numbers: String) -> [Int] {
    
    let numbers = Array(numbers).map { String($0) }
    var result: Set<Int> = []

    var isUsed = [Bool](repeating: false, count: numbers.count)
    var cur: [String] = []    
    
    func select(_ k: Int) {        
        
        if k == n {
            result.insert(Int(cur.joined())!)
            return
        }
        
        for i in 0..<numbers.count {
            if !isUsed[i] {
                cur.append(numbers[i])
                isUsed[i] = true
                select(k+1)
                isUsed[i] = false
                cur.removeLast()
            }
        }
    }
    select(0)
    
    return Array(result)
}

func isPrime(_ num: Int) -> Bool {
    
    if num == 0 || num == 1 { return false }
    if num == 2 || num == 3 { return true }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }
    
    return true
}