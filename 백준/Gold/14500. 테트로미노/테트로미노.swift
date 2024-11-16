// 서로 겹치면 안된다.
// 도형은 모두 연결되어 있어야 한다.
// 변끼리 맞닿아 있어야 한다.
// 총 5가지 종류가 있다.

// N*M 종이 위에 하나를 놓으려고 한다.
// 각 칸에는 정수가 쓰여져 있다.

// 테트로미노가 놓은 칸의 수의 합을 최대로

// 회전, 대칭이 가능하다.
// 4 <= N,M < 500

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var map: [[Int]] = []
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var ans = 0
for i in 0..<N {
    for j in 0..<M {
        for num in [
            case1(x: i, y: j),
            case2(x: i, y: j),
            case3(x: i, y: j),
            case4(x: i, y: j),
            case5(x: i, y: j)
        ] {
            ans = max(ans, num)
        }
    }
}
print(ans)

func case1(x: Int, y: Int) -> Int {
    var tot = 0
    
    // 가로 ----
    if 0...N ~= x && 0...M-4 ~= y {
        var ans = 0
        for i in 0..<4 {
            ans += map[x][y+i]
        }
        tot = max(tot, ans)
    }
    
    // 세로
    if 0...N-4 ~= x && 0...M ~= y {
        var ans = 0
        for i in 0..<4 {
            ans += map[x+i][y]
        }
        tot = max(tot, ans)
    }
    
    return tot
}

func case2(x: Int, y: Int) -> Int {
    var tot = 0
    
    if 0...N-2 ~= x && 0...M-2 ~= y {
        var ans = 0
        for i in 0..<2 {
            for j in 0..<2 {
                ans += map[x+i][y+j]
            }
        }
        tot = max(tot, ans)
    }
    
    return tot
}

func case3(x: Int, y: Int) -> Int {
    var tot = 0
    
    if 0...N-3 ~= x && 0...M-2 ~= y {
        var rec = 0
        for i in 0..<3 {
            for j in 0..<2 {
                rec += map[x+i][y+j]
            }
        }
        
        var ans1 = rec - map[x][y] - map[x+1][y]
        var ans2 = rec - map[x][y+1] - map[x+1][y+1]
        var ans3 = rec - map[x+1][y] - map[x+2][y]
        var ans4 = rec - map[x+1][y+1] - map[x+2][y+1]

        for ans in [ans1, ans2, ans3, ans4] {
            tot = max(ans, tot)
        }
    }
    
    if 0...N-2 ~= x && 0...M-3 ~= y {
        var rec = 0
        for i in 0..<2 {
            for j in 0..<3 {
                rec += map[x+i][y+j]
            }
        }
        
        var ans1 = rec - map[x][y+1] - map[x][y+2]
        var ans2 = rec - map[x][y] - map[x][y+1]
        var ans3 = rec - map[x+1][y+1] - map[x+1][y+2]
        var ans4 = rec - map[x+1][y] - map[x+1][y+1]

        for ans in [ans1, ans2, ans3, ans4] {
            tot = max(ans, tot)
        }
    }
    
    return tot
}

func case4(x: Int, y: Int) -> Int {
    var tot = 0
    
    if 0...N-3 ~= x && 0...M-2 ~= y {
        var rec = 0
        for i in 0..<3 {
            for j in 0..<2 {
                rec += map[x+i][y+j]
            }
        }
        
        var ans1 = rec - map[x][y] - map[x+2][y+1]
        var ans2 = rec - map[x+2][y] - map[x][y+1]

        tot = max(tot, max(ans1, ans2))
    }
    
    if 0...N-2 ~= x && 0...M-3 ~= y {
        var rec = 0
        for i in 0..<2 {
            for j in 0..<3 {
                rec += map[x+i][y+j]
            }
        }
        
        var ans1 = rec - map[x][y] - map[x+1][y+2]
        var ans2 = rec - map[x+1][y] - map[x][y+2]

        tot = max(tot, max(ans1, ans2))
    }
    
    return tot
}

func case5(x: Int, y: Int) -> Int {
    var tot = 0
    
    if 0...N-2 ~= x && 0...M-3 ~= y {
        // ㅗ
        var rec = 0
        for i in 0..<2 {
            for j in 0..<3 {
                rec += map[x+i][y+j]
            }
        }
        
        var ans1 = rec - map[x][y] - map[x][y+2]
        var ans2 = rec - map[x+1][y] - map[x+1][y+2]

        tot = max(tot, max(ans1, ans2))
    }
    
    if 0...N-3 ~= x && 0...M-2 ~= y {
        var rec = 0
        for i in 0..<3 {
            for j in 0..<2 {
                rec += map[x+i][y+j]
            }
        }
        
        var ans1 = rec - map[x][y] - map[x+2][y]
        var ans2 = rec - map[x][y+1] - map[x+2][y+1]

        tot = max(tot, max(ans1, ans2))
    }
    
    return tot
}
