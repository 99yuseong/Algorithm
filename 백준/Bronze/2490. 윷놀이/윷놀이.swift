import Foundation

let input1 = readLine()!.components(separatedBy: " ").map { Int($0)! }
let input2 = readLine()!.components(separatedBy: " ").map { Int($0)! }
let input3 = readLine()!.components(separatedBy: " ").map { Int($0)! }

func print(a: Int) {
    if a == 0 {
        print("D")
    } else if a == 1 {
        print("C")
    } else if a == 2 {
        print("B")
    } else if a == 3 {
        print("A")
    } else {
        print("E")
    }
}

print(a: input1.reduce(0, +))
print(a: input2.reduce(0, +))
print(a: input3.reduce(0, +))
