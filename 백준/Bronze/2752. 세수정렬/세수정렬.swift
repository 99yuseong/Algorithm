import Foundation

print(
    readLine()!
      .components(separatedBy: " ")
      .map { Int($0)! }
      .sorted()
      .map { String($0) }
      .joined(separator: " ")
)
