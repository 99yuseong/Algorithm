import Foundation

let N = Int(readLine()!)!
var nums: [Int] = []

for _ in 0..<N {
    nums.append(Int(readLine()!)!)
}

for num in nums.sorted() {
    print(num)
}
