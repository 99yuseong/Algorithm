import Foundation

let N = Int(readLine()!)!

var nums = readLine()!.components(separatedBy: " ").map { Int($0)! }
var result = 0
var totalSum = nums.reduce(0, +)

for num in nums {
    totalSum -= num
    result += totalSum * num
}

print(result)
