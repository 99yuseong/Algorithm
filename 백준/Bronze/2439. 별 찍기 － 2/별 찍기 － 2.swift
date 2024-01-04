import Foundation

let n = Int(readLine()!)!

for i in 1...n {
    let line = String(repeating: " ", count: n - i) + String(repeating: "*", count: i)
    print(line)
}