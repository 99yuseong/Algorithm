import Foundation

let n = Int(readLine()!)!

for i in 1...n {
    let line = String(repeating: " ", count: n - i) + String(repeating: "*", count: 2 * i - 1)
    print(line)
}

for i in 1..<n {
    let line = String(repeating: " ", count: i) + String(repeating: "*", count: 2 * (n - i) - 1)
    print(line)
}
