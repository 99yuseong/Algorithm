import Foundation

let N = Int(readLine()!)!

var nums = readLine()!.components(separatedBy: " ").map { Int($0)! }
var result = 0
var totalSum = 0

nums.forEach { totalSum += $0 }

for num in nums {
    let lastNum = nums.popLast()!
    totalSum -= lastNum
    result += totalSum * lastNum
}

print(result)