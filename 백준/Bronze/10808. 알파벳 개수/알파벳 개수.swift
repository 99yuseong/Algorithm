import Foundation

let input = readLine()!

var arr = [Int](repeating: 0, count: 26)

for i in input {
    arr[Int(UnicodeScalar(String(i))!.value) - 97] += 1
}

print(arr.map { String($0) }.joined(separator: " "))