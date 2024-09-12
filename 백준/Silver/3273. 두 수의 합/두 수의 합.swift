import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let x = Int(readLine()!)!

let set = Set(nums)
var result = 0

for num in nums {
    if set.contains(x - num) { result += 1 }
}

print(result / 2)
