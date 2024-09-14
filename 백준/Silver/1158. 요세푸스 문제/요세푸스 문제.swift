import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input.first!
let K = input.last!

var arr = Array(1...N)
var curIdx = K-1
var resultArr: [Int] = []

while true {
    resultArr.append(arr.remove(at: curIdx))
    if arr.isEmpty { break }
    curIdx = (curIdx - 1 + K) % arr.count
}

print("<" + resultArr.map { String($0) }.joined(separator: ", ") + ">")