let input = readLine()!.split(separator: " ").map { Int($0)! }
let A = input[0]
let B = input[1]
let C = input[2]

// A^B % C
func sol(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if b == 1 { return a % c }
    var val = sol(a, b/2, c)
    val = val * val % c
    if b % 2 == 0 { return val }
    return val * a % c
}

print(sol(A, B, C))