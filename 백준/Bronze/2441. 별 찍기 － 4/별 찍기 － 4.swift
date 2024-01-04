import Foundation

let n = Int(readLine()!)!

for i in 1...n {
    let line = String(repeating: " ", count: i - 1) + String(repeating: "*", count: n - i + 1)
    print(line)
}