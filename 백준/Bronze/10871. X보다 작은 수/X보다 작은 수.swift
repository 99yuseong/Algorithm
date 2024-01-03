import Foundation

let result = readLine()!.components(separatedBy: " ").map { Int($0)! }
let arr = readLine()!.components(separatedBy: " ").map { Int($0)! }
var output: [Int] = []

for item in arr {
    if item < result[1] {
        output.append(item)
    }
}

print(output.map { String($0) }.joined(separator: " "))