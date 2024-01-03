import Foundation

var i = 0
var nums: [Int] = []

while i < 5 {
    let input = Int(readLine()!)!
    nums.append(input)
    i += 1
}
nums.sort()

print(nums.reduce(0, +) / nums.count)
print(nums[2])