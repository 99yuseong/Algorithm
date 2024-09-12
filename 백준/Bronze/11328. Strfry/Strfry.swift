import Foundation

var n = Int(readLine()!)!
for _ in 0..<n {
    let stringValue = readLine()!.split(separator: " ").map{String($0)}
    var alphabet = Array(repeating: 0, count: 26)
    var flag = true
    for s in stringValue[0]{
        alphabet[Int(exactly: s.asciiValue!)! - 97] += 1
    }
    for s in stringValue[1]{
        alphabet[Int(exactly: s.asciiValue!)! - 97] -= 1
    }
    for a in alphabet {
        if a != 0 {
            flag = false
            break
        }
    }
    print(flag ? "Possible" : "Impossible")
}

