import Foundation

let input = readLine()!
                .components(separatedBy: " ")
                .map { Int($0)! }

let n = input.first!
let x = input.last!
var result = ""

for num in readLine()!.components(separatedBy: " ").map({ Int($0)! }) {
    result += num < x ? "\(num) " : ""
}

print(result)