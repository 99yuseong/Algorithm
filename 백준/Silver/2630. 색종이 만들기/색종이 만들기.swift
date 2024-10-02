let N = Int(readLine()!)!
var paper: [[Int]] = []
for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    paper.append(line)
}
var answer: [Int] = [0,0]

func check(_ x: Int, _ y: Int, _ n: Int) -> Bool {
    for i in x..<x+n {
        for j in y..<y+n {
            if paper[i][j] != paper[x][y] {
                return false
            }
        }
    }
    return true
}

// x,y 부터시작해서 n개의 길이 영역의 종이에 있는 0과 1의 개수
func sol(_ x: Int, _ y: Int, _ n: Int) {
    if check(x, y, n) {
        answer[paper[x][y]] += 1
        return
    }
    
    sol(x, y, n/2)
    sol(x + n/2, y, n/2)
    sol(x, y + n/2, n/2)
    sol(x + n/2, y + n/2, n/2)
}

sol(0, 0, N)
print(answer.map { String($0) }.joined(separator: "\n"))
