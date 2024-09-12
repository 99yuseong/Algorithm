import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let x = Int(readLine()!)!

print(nums.reduce(0) { $0 + ($1 == x ? 1 : 0) })
