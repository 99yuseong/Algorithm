import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

let n: Int = input[0]
let k: Int = input[1]

var arr = Array(1...n)
var result: [Int] = []
var idx: Int = k - 1

while true {
    result.append(arr.remove(at: idx))
    if arr.isEmpty { break }
    idx = (idx - 1 + k) % arr.count
}

print("<\(result.map { String($0) }.joined(separator: ", "))>")
