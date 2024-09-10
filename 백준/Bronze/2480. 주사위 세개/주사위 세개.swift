import Foundation

let nums = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

if Set(nums).count == 3 {
    print("\(nums.max()! * 100)")
} else if Set(nums).count == 1 {
    print("\(10000 + nums[0] * 1000)")
} else {
    print("\(1000 + (nums[0] == nums[1] ? nums[0] : nums[2]) * 100)")
}
