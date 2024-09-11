import Foundation

let N = Int(readLine()!)!
for i in 0..<N {
    print(
        String(repeating: " ", count: i)
        + String(repeating: "*", count: 2*(N-i)-1)
    )
}
for i in 1..<N {
    print(
        String(repeating: " ", count: N-i-1)
        + String(repeating: "*", count: 2 * i + 1)
    )
}
