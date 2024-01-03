import Foundation

let inp = readLine()!.components(separatedBy: [" "]).map { $0 }
let (s1, a) = (inp[0], Int(inp[1])!)

var output = s1
var i = 1

while i < a {
    output += s1
    i += 1
}

print(output)