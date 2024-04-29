import Foundation

var word = readLine()!
            .map { String($0) }
            .filter { "a"..."z" ~= $0 || "A"..."Z" ~= $0 }
            .count

print(word)