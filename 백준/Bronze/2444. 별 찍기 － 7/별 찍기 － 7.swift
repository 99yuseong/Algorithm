import Foundation

let N = Int(readLine()!)!
for i in 0..<(N-1) {
    print(String(repeating: " ", count: (N-1)-i) + String(repeating: "*", count: 2 * i + 1))
}
for i in 0..<N {
    print(String(repeating: " ", count: i) + String(repeating: "*", count: 2 * (N - i) - 1))
}

