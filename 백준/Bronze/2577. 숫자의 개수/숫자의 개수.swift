import Foundation

var i: Int = 0
var total: Int = 1
while i < 3 {
    let input = Int(readLine()!)!
    total *= input
    i += 1
}

var counts = [Int](repeating: 0, count: 10)

for num in String(total) {
    counts[Int(String(num))!] += 1
}

for count in counts {
    print(count)
}
