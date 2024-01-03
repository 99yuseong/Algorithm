import Foundation

let callNum = Int(readLine()!)
let callTimes = readLine()!.components(separatedBy: " ").map { Int($0)! }

var yPrice: Int = 0
var mPrice: Int = 0

for call in callTimes {
    yPrice += (Int(call / 30) + 1) * 10
    mPrice += (Int(call / 60) + 1) * 15
}

if yPrice == mPrice {
    print("Y M \(yPrice)")
} else if yPrice < mPrice {
    print("Y \(yPrice)")
} else {
    print("M \(mPrice)")
}
