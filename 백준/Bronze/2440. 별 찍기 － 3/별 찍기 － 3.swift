import Foundation

let N = Int(readLine()!)!
for i in 0..<N {
    print(String(repeating: "*", count: N-i))
}
