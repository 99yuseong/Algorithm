import Foundation

let n = Int(readLine()!)!

out: for _ in 0..<n {
    let test = readLine()!.components(separatedBy: " ")
    var alphabets = [Int](repeating: 0, count: 26)
    
    for char in test[0] {
        alphabets[Int(char.asciiValue!) - 97] += 1
    }
    
    for char in test[1] {
        alphabets[Int(char.asciiValue!) - 97] -= 1
    }
    
    for i in 0..<alphabets.count {
        if alphabets[i] != 0 {
            print("Impossible")
            continue out
        }
    }
    print("Possible")
}
