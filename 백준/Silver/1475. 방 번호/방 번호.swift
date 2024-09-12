import Foundation

let input = readLine()!
var total = 1
var arr = Array(repeating: 0, count: 10)

for char in input {
    arr[Int(String(char))!] += 1
}

let num = (arr[6] + arr[9] + 1) / 2
arr[6] = num
arr[9] = num
print(arr.max()!)
