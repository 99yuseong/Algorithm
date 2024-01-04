import Foundation

let n = Int(readLine()!)!

for i in 1...n {
    let space = String(repeating: " ", count: i - 1)
    let star = String(repeating: "*", count: 2 * (n - i + 1) - 1)
    print(space + star)
}

for i in 1..<n {
    let space = String(repeating: " ", count: n - i - 1)
    let star = String(repeating: "*", count: 2 * i + 1)
    print(space + star)    
}