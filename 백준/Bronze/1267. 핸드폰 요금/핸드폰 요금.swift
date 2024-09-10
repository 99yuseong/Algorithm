import Foundation

let N = Int(readLine()!)!
var y: Int = 0
var m: Int = 0

let times = readLine()!.split(separator: " ").map { Int($0)! }

for time in times {
    y += (Int(time / 30) + 1) * 10
    m += (Int(time / 60) + 1) * 15
}

if y == m {
    print("Y M \(y)")
} else {
    print(y > m ? "M \(m)" : "Y \(y)")
}
