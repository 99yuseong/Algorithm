import Foundation

let n = Int(readLine()!)!
var cards = Array(1...n)
var index: Int = 0

while cards.count - 1 != index {
    index += 1
    cards.append(cards[index])
    index += 1
}

print(cards.last!)
