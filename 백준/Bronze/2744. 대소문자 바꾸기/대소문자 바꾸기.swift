import Foundation

var word = readLine()!
            .map { String($0) }
            .map { "a"..."z" ~= $0 ? $0.uppercased() : $0.lowercased() }
            .joined()

print(word)