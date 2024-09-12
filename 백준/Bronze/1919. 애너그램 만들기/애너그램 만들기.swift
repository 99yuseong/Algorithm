import Foundation

let a = readLine()!
let b = readLine()!

var arr = Array(repeating: 0, count: 26)

for char in a {
    arr[Int(String(char.asciiValue!))! - 97] += 1
}

for char in b {
    arr[Int(String(char.asciiValue!))! - 97] -= 1
}

print(arr.reduce(0) { $0 + ($1 == 0 ? 0 : abs($1)) })