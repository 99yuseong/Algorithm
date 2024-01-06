import Foundation

let input = readLine()!

var arr = [Int](repeating: 0, count: 26)

for i in input {
    if i == "a" { arr[0] = arr[0] + 1 }
    if i == "b" { arr[1] = arr[1] + 1 }
    if i == "c" { arr[2] = arr[2] + 1 }
    if i == "d" { arr[3] = arr[3] + 1 }
    if i == "e" { arr[4] = arr[4] + 1 }
    if i == "f" { arr[5] = arr[5] + 1 }
    if i == "g" { arr[6] = arr[6] + 1 }
    if i == "h" { arr[7] = arr[7] + 1 }
    if i == "i" { arr[8] = arr[8] + 1 }
    if i == "j" { arr[9] = arr[9] + 1 }
    if i == "k" { arr[10] = arr[10] + 1 }
    if i == "l" { arr[11] = arr[11] + 1 }
    if i == "m" { arr[12] = arr[12] + 1 }
    if i == "n" { arr[13] = arr[13] + 1 }
    if i == "o" { arr[14] = arr[14] + 1 }
    if i == "p" { arr[15] = arr[15] + 1 }
    if i == "q" { arr[16] = arr[16] + 1 }
    if i == "r" { arr[17] = arr[17] + 1 }
    if i == "s" { arr[18] = arr[18] + 1 }
    if i == "t" { arr[19] = arr[19] + 1 }
    if i == "u" { arr[20] = arr[20] + 1 }
    if i == "v" { arr[21] = arr[21] + 1 }
    if i == "w" { arr[22] = arr[22] + 1 }
    if i == "x" { arr[23] = arr[23] + 1 }
    if i == "y" { arr[24] = arr[24] + 1 }
    if i == "z" { arr[25] = arr[25] + 1 }
}

print(arr.map { String($0) }.joined(separator: " "))
