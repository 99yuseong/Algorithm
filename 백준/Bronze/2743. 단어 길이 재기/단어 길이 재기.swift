import Foundation

var word = readLine()!
            .map { $0.asciiValue! }
            .filter { (65...90) ~= $0 || (97...122) ~= $0 }
            .count

print(word)
