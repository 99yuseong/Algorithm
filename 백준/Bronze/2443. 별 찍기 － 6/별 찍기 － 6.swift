import Foundation

let N = Int(readLine()!)!
for i in 1...N {
    print(String(repeating: " ", count: i-1) + String(repeating: "*", count: 2 * (N - i) + 1))
}
