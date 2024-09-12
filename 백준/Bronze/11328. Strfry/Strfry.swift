import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    var arr = Array(repeating: 0, count: 26)
    var isPossible = true
    
    for char in input[0] {
        arr[Int(char.asciiValue! - 97)] += 1
    }
    for char in input[1] {
        arr[Int(char.asciiValue! - 97)] -= 1
    }
    
    for char in arr {
        if char != 0 {
            isPossible = false
        }
    }
    
    print(isPossible ? "Possible" : "Impossible")
}


