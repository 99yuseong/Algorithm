import Foundation

var counts = [Int](repeating: 0, count: 10)

let input = readLine()!

for num in input {
    counts[Int(String(num))!] += 1
}

counts[9] = Int((counts[9] + counts[6] + 1) / 2)
counts[6] = 0

print(counts.max()!)
