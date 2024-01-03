import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

let a = input[0]
let b = input[1]
let c = input[2]

if a == b && a == c {
    print(10000 + a * 1000)
} else if a != b && b != c && a != c {
    print(input.max()! * 100)
} else {
    if a == b || a == c{
        print(1000 + a * 100)
    } else {
        print(1000 + b * 100)
    }
}