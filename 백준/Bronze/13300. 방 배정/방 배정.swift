import Foundation

var students = [[Int]](repeating: [0,0], count: 6)
var count: Int = 0

let numAndMax = readLine()!.components(separatedBy: " ").map { Int($0)! }
var n: Int = numAndMax[0]
var max: Int = numAndMax[1]

var i: Int = 0
while i < n {
    let genderAndYear = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let gender: Int = genderAndYear[0]
    let year: Int = genderAndYear[1]
    students[year - 1][gender] += 1
    i += 1
}

for year in students {
    for mAndW in year {
        count += Int(mAndW / max) + (mAndW % max == 0 ? 0 : 1)
    }
}

print(count)
