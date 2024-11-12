let NMK = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NMK[0] // 세로
let M = NMK[1] // 가로
let K = NMK[2] // 스티커 수
var r = 0
var c = 0
var box = Array(repeating: Array(repeating: 0, count: M), count: N)
var sticker: [[Int]] = []

out: for _ in 0..<K {
    let rc = readLine()!.split(separator: " ").compactMap { Int($0) }
    r = rc[0]
    c = rc[1]
    sticker = []
    
    for _ in 0..<r {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        sticker.append(line)
    }
    
    for _ in 0..<4 {
        guard N-r >= 0 && M-c >= 0 else {
            rotate()
            continue
        }
            
        for i in 0...max(0, N-r) {
            for j in 0...max(0, M-c) {
                if pastable(x: i, y: j) {
                    paste(x: i, y: j)
                    continue out
                }
            }
        }
        rotate()
    }
}

var cnt = 0
for i in 0..<N {
    for j in 0..<M {
        if box[i][j] == 1 { cnt += 1 }
    }
}
print(cnt)

func pastable(x: Int, y: Int) -> Bool {
    for i in 0..<r {
        for j in 0..<c {
            if box[x+i][y+j] == 1 && sticker[i][j] == 1 {
                return false
            }
        }
    }
    return true
}

func paste(x: Int, y: Int) {
    for i in 0..<r {
        for j in 0..<c {
            if sticker[i][j] == 1 {
                box[x+i][y+j] = 1
            }
        }
    }
}

func rotate() {
    var tmp = Array(repeating: Array(repeating: 0, count: r), count: c)
    
    for i in 0..<c {
        for j in 0..<r {
            tmp[i][j] = sticker[r-1-j][i]
        }
    }
    
    sticker = tmp
    swap(&r, &c)
}
