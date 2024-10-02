let N = Int(readLine()!)!
var video: [[Int]] = []
for _ in 0..<N {
    video.append(Array(readLine()!).map { Int(String($0))! })
}

func check(_ x: Int, _ y: Int, _ n: Int) -> Bool {
    for i in x..<x+n {
        for j in y..<y+n {
            if video[i][j] != video[x][y] {
                return false
            }
        }
    }
    return true
}

var answer = ""

func recur(_ x: Int, _ y: Int, _ n: Int) {
    if check(x, y, n) {
        answer += "\(video[x][y])"
        return
    }
    
    answer += "("
    recur(x, y, n/2)
    recur(x, y + n/2, n/2)
    recur(x + n/2, y, n/2)
    recur(x + n/2, y + n/2, n/2)
    answer += ")"
}

recur(0, 0, N)
print(answer)
