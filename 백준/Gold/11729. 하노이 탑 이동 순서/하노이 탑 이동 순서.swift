let N = Int(readLine()!)!
var count = 0
var result: [String] = []

func sol(_ a: Int, _ b: Int, _ n: Int) {
    if n == 1 {
        result.append("\(a) \(b)")
        count += 1
        return
    }
    sol(a, 6-a-b, n-1)
    result.append("\(a) \(b)")
    count += 1
    sol(6-a-b, b, n-1)
}

sol(1, 3, N)
print(count)
for move in result {
    print(move)
}
