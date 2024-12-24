let N = Int(readLine()!)!

var x = N
var i = 1
while i < x {
    x -= i
    i += 1
}
// i번째 무리의 x번째 수
// (11) (12 21) (31 22 13) (14 32 23 41)
var first = i+1 - x
var second = x
if i % 2 == 1 { print("\(first)/\(second)") }
else { print("\(second)/\(first)") }
