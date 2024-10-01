let N = Int(readLine()!)!
var paper: [[Int]] = []
var answer: [Int] = [0,0,0]

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    paper.append(line)
}

// 종이의 숫자가 모두 같은 지 체크
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

// x,y부터 시작해서 n까지 해당하는 영역의 개수를 세는 함수
func sol(_ x: Int, _ y: Int, _ n: Int) {
    if check(x,y,n) {
        // 종이의 숫자가 모두 같다면 해당 위치에 +1
        answer[paper[x][y]+1] += 1
        return
    }
    
    // 아니라면 9등분해서 더해주기 연산
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
