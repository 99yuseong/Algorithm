let N = Int(readLine()!)!
var paper: [[Int]] = []

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    paper.append(line)
}

// 9등분해서 값을 리턴
func sol(_ x: Int, _ y: Int, _ n: Int) -> [Int] {
    if n == 1 {
        switch paper[x][y] {
        case -1: return [1,0,0]
        case 0: return [0,1,0]
        default: return [0,0,1]
        }
    }
        
    for i in x..<x+n {
        for j in y..<y+n {
            if paper[i][j] != paper[x][y] {
                return [
                    sol(x + n * 0/3, y + n * 0/3, n/3),
                    sol(x + n * 0/3, y + n * 1/3, n/3),
                    sol(x + n * 0/3, y + n * 2/3, n/3),
                    sol(x + n * 1/3, y + n * 0/3, n/3),
                    sol(x + n * 1/3, y + n * 1/3, n/3),
                    sol(x + n * 1/3, y + n * 2/3, n/3),
                    sol(x + n * 2/3, y + n * 0/3, n/3),
                    sol(x + n * 2/3, y + n * 1/3, n/3),
                    sol(x + n * 2/3, y + n * 2/3, n/3),
                ].reduce([0,0,0]) {
                    [$0[0] + $1[0], $0[1] + $1[1], $0[2] + $1[2]]
                }
            }
        }
    }
    
    switch paper[x][y] {
    case -1: return [1,0,0]
    case 0: return [0,1,0]
    default: return [0,0,1]
    }
}

for cnt in sol(0, 0, N) {
    print(cnt)
}
