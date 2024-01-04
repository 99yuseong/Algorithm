import Foundation

var i: Int = 0
var cards: [Int] = []

for num in 1...20 {
    cards.append(num)
}

while i < 10 {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    var a = input[0] - 1
    var b = input[1] - 1
    
    var j = Int((b - a + 1) / 2)
    while j > 0 {
        let tmp = cards[a]
        cards[a] = cards[b]
        cards[b] = tmp
        a += 1
        b -= 1
        j -= 1
    }
    i += 1
}

print(cards.map { String($0) }.joined(separator: " "))
