import Foundation

let n = Int(readLine()!)!

for i in 1...n {
    let star = String(repeating: "*", count: i)
    let space = String(repeating: " ", count: (n - i) * 2)
    print(star + space + star)
}

for i in 1..<n {
    let star = String(repeating: "*", count: n - i)
    let space = String(repeating: " ", count: i * 2)
    print(star + space + star)
}

