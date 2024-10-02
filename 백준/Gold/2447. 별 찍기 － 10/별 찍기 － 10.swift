let N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: " ", count: N), count: N)

func draw(_ x: Int, _ y: Int) {
    for i in x..<x+3 {
        for j in y..<y+3 {
            if i == x+1 && j == y+1 {
                continue
            } else {
                arr[i][j] = "*"
            }
        }
    }
}

func recur(_ x: Int, _ y: Int, _ n: Int) {
    if n == 3 {
        draw(x, y)
        return
    }
    
    recur(x + n/3 * 0, y, n/3)
    recur(x + n/3 * 1, y, n/3)
    recur(x + n/3 * 2, y, n/3)
    recur(x + n/3 * 0, y + n/3 * 1, n/3)
//    recur(x + n/3 * 1, y + n/3 * 1, n/3)
    recur(x + n/3 * 2, y + n/3 * 1, n/3)
    recur(x + n/3 * 0, y + n/3 * 2, n/3)
    recur(x + n/3 * 1, y + n/3 * 2, n/3)
    recur(x + n/3 * 2, y + n/3 * 2, n/3)
}

recur(0, 0, N)
for i in 0..<N {
    print(arr[i].joined())
}
