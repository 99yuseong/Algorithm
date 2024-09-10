import Foundation

var nums: [Int] = []

for _ in 0..<9 {
    nums.append(Int(readLine()!)!)
}
nums.sort()

let sum = nums.reduce(0, +)

for i in 0..<9 {
    for j in i..<9 {
        if sum - nums[i] - nums[j] == 100 {
            for k in 0..<9 {
                if k != i && k != j { print(nums[k]) }
            }
            exit(0)
        }
    }
}
