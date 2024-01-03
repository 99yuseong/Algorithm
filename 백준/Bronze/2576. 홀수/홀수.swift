import Foundation

var odds: [Int] = []
var i = 0

while i < 7 {
    let input = Int(readLine()!)!
    if input % 2 == 1 {
        odds.append(input)
    }
    i += 1
}

if odds.isEmpty {
    print(-1)
} else {
    print(odds.reduce(0, +))
    print(odds.min()!)
}
