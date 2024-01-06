import Foundation

var counts = [Int](repeating: 0, count: 10)

let input = readLine()!

for num in input {
    counts[Int(String(num))!] += 1
}

var sixAndNine: Int = Int((counts[6] + counts[9] + 1) / 2)
counts.remove(at: 9)
counts.remove(at: 6)

var maxSet: Int = counts.max()!

print(max(maxSet, sixAndNine))
