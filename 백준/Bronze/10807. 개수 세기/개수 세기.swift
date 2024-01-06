import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.components(separatedBy: " ").map { Int($0)! }
let v = Int(readLine()!)!

var count: Int = 0

for num in nums {
    if num == v {
        count += 1
    }
}

print(count)