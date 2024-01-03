import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
var a: Int = 0
var b: Int = 0

if input[0] <= input[1] {
    a = input[0]
    b = input[1]
} else {
    a = input[1]
    b = input[0]
}

var numBtw: [Int] = []

if a == b {
    print(0)
    print()
} else {
    for i in a+1..<b {
        numBtw.append(i)
    }

    print(b - a - 1)
    print(numBtw.map { String($0) }.joined(separator: " "))
}
