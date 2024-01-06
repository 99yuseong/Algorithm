import Foundation

let first = readLine()!
let second = readLine()!

var alphabets = [Int](repeating: 0, count: 26)

for char in first {
    alphabets[Int(char.asciiValue!) - 97] += 1
}

for char in second {
    alphabets[Int(char.asciiValue!) - 97] -= 1
}

var count: Int = 0

for alphabet in alphabets {
    count += abs(alphabet)
}
print(count)
