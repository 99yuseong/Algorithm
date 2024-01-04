import Foundation

let n = Int(readLine()!)!

for i in 1...n {
    let j = n - i + 1
    print(String(repeating: "*", count: j))
}