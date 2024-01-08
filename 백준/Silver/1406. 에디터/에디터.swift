//
//import Foundation
//
//let string = readLine()!
//let n = Int(readLine()!)!
//var cursor = string.count
//
//let MX: Int = 100
//var data: [String] = Array(repeating: "", count: MX)
//var prev: [Int] = Array(repeating: -1, count: MX)
//var next: [Int] = Array(repeating: -1, count: MX)
//var unused: Int = 1
//
//func printData() {
//    var result = ""
//    var addr = 0
//    while next[addr] != -1 {
//        result += data[addr]
//        addr = next[addr]
//    }
//    print(result)
//}
//
//func insert(_ str: String, at addr: Int) {
//    data[unused] = str
//    prev[unused] = addr
//    next[unused] = next[addr]
//    if next[addr] != -1 {
//        prev[next[addr]] = unused
//    }
//    next[addr] = unused
//    unused += 1
//}
//
//func remove(at addr: Int) {
//    next[prev[addr]] = next[addr]
//    if next[addr] != -1 {
//        prev[next[addr]] = prev[addr]
//    }
//}
//
//next[0] = unused
//for str in string {
//    data[unused] = String(str)
//    prev[unused] = unused - 1
//    next[unused] = unused + 1
//    unused += 1
//}
//
//for _ in 0..<n {
//    let command = readLine()!.components(separatedBy: " ")
//    
//    if command[0] == "L" {
//        if prev[cursor] != -1 {
//            cursor = prev[cursor]
//        }
//    }
//    
//    if command[0] == "D" {
//        if next[cursor] != -1 {
//            cursor = next[cursor]
//        }
//    }
//    
//    if command[0] == "B" {
//        if prev[cursor] != -1 {
//            remove(at: cursor)
//            cursor = prev[cursor]
//        }
//    }
//    
//    if command[0] == "P" {
//        insert(command[1], at: cursor)
//        cursor = next[cursor]
//    }
//}
//
//printData()

import Foundation

var left = Array(readLine()!)
var right: [Character] = []
let n = Int(readLine()!)!

for _ in 0..<n {
    let command = readLine()!
    switch command {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D":
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B":
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(command.last!)
    }
}

print(String(left + right.reversed()))
