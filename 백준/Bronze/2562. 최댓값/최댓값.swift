import Foundation

var max = 0
var idx = 0

for i in 1...9 {
    let num = Int(readLine()!)!
    if max < num {
        max = num
        idx = i
    }
}

print(max)
print(idx)
