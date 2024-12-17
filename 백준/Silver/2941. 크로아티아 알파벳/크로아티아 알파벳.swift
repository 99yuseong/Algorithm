import Foundation

var word = readLine()!
let alpha = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

for a in alpha {
    word = word.replacingOccurrences(of: a, with: "#")
}

print(word.count)