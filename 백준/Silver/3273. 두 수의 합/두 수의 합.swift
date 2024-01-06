import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()
let x = Int(readLine()!)!

var start: Int = 0
var end: Int = n - 1
var count: Int = 0

while start < end {
    if nums[start] + nums[end] == x {
        count += 1
        start += 1
        end -= 1
    } else if nums[start] + nums[end] < x {
        start += 1
    } else {
        end -= 1
    }
}
print(count)
