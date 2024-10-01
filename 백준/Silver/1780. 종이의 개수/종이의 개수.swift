let N = Int(readLine()!)!
var paper: [[Int]] = []
var answer: [Int] = [0,0,0]

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    paper.append(line)
}

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

func sol(_ x: Int, _ y: Int, _ n: Int) {
    if check(x,y,n) {
        answer[paper[x][y]+1] += 1
        return
    }
    
    for i in 0..<3 {
        for j in 0..<3 {
            sol(x + (i * n) / 3 , y + (j * n) / 3, n / 3)
        }
    }
}

sol(0, 0, N)
print(answer[0])
print(answer[1])
print(answer[2])
