import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    
    var A = A.sorted()
    var B = B.sorted { $0 > $1 }
    var ans = 0
    
    for i in 0..<A.count {
        ans += A[i] * B[i]
    }
    
    return ans
}