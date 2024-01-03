import Foundation

var i = 0
var heights: [Int] = []
var first = 0
var second = 0

while i < 9 {
    let input = Int(readLine()!)!
    heights.append(input)
    i += 1
}

let total = heights.reduce(0, +)

for j in 0..<8 {
    for k in j+1..<9 {
        if total - heights[j] - heights[k] == 100 {
            first = k
            second = j
            break
        }
    }
}

heights.remove(at: first)
heights.remove(at: second)

for height in heights.sorted() {
    print(height)
}
