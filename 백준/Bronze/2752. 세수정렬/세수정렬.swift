import Foundation

var input = readLine()!.components(separatedBy: " ").map { Int($0)! }
input.sort()
print(input.map{ String($0) }.joined(separator: " "))