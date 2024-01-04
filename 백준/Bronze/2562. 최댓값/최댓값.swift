import Foundation

var i = 0
var nums: [Int] = []

while i < 9 {
    let n = Int(readLine()!)!
    nums.append(n)
    i += 1
}

let max = nums.max()!
let index = nums.firstIndex(of: max)!

print(max)
print(index + 1)
