import Foundation

extension Int {
    func isPrime() -> Bool {
        if self < 2 { return false }
        var i = 2
        while i * i <= self {
            if self % i == 0 { return false }
            i += 1
        }
        return true
    }
}

func permutation(_ arr: [String], _ k: Int) -> [String] {
    
    var answer: [String] = []
    var selected: [String] = []
    var isUsed = [Bool](repeating: false, count: arr.count)
    
    func select(_ s: Int) {
        
        if s == k {
            answer.append(selected.reduce("", +))
        }
        
        for i in 0..<arr.count {
            if !isUsed[i] {
                selected.append(arr[i])
                isUsed[i] = true
                select(s+1)
                isUsed[i] = false
                selected.removeLast()
            }
        }
    }
    select(0)
    
    return answer
}

func solution(_ numbers:String) -> Int {
    
    var nums = Array(numbers).map { String($0) }
    
    var primeSet = Set<Int>()
    
    for i in 1...nums.count {
        let num = permutation(nums, i).map { Int($0)! }
        
        for n in num {
            if n.isPrime() {
                primeSet.insert(n)
            }
        }
    }
    
    return primeSet.count
}