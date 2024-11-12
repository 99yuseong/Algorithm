let NandM = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NandM[0]
let M = NandM[1]
var box: [[Int]] = []
var cctv: [[Int]] = [] // x, y

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    box.append(input)
}

for i in 0..<N {
    for j in 0..<M {
        if 1..<6 ~= box[i][j] { cctv.append([i, j]) }
    }
}

var answer = N*M
func count(box: [[Int]]) -> Int {
    var cnt = 0
    for i in 0..<N {
        for j in 0..<M {
            if box[i][j] == 0 { cnt += 1 }
        }
    }
    
    return cnt
}

func watch(_ k: Int, box: [[Int]]) { // 0번째 CCTV부터 시청
    if k == cctv.count {
        answer = min(answer, count(box: box))
        return
    }
    
    let x = cctv[k][0]
    let y = cctv[k][1]
    
    switch box[x][y] {
    case 1:
        for i in 0..<4 {
            watch(k+1, box: watch1(side: i, box: box, x: x, y: y))
        }
    case 2:
        for i in 0..<2 {
            watch(k+1, box: watch2(side: i, box: box, x: x, y: y))
        }
    case 3:
        for i in 0..<4 {
            watch(k+1, box: watch3(side: i, box: box, x: x, y: y))
        }
    case 4:
        for i in 0..<4 {
            watch(k+1, box: watch4(side: i, box: box, x: x, y: y))
        }
    case 5:
        watch(k+1, box: watch5(box: box, x: x, y: y))
    default:
        break
    }
}
watch(0, box: box)
print(answer)

func watch1(side: Int, box: [[Int]], x: Int, y: Int) -> [[Int]] {
    var newBox = box
    switch side {
    case 0:
        watchUp(x: x, y: y, box: &newBox)
    case 1:
        watchRight(x: x, y: y, box: &newBox)
    case 2:
        watchDown(x: x, y: y, box: &newBox)
    case 3:
        watchLeft(x: x, y: y, box: &newBox)
    default: break
    }
    return newBox
}

func watch2(side: Int, box: [[Int]], x: Int, y: Int) -> [[Int]] {
    var newBox = box
    switch side {
    case 0:
        watchUp(x: x, y: y, box: &newBox)
        watchDown(x: x, y: y, box: &newBox)
        
    case 1:
        watchRight(x: x, y: y, box: &newBox)
        watchLeft(x: x, y: y, box: &newBox)
        
    default: break
    }
    return newBox
}

func watch3(side: Int, box: [[Int]], x: Int, y: Int) -> [[Int]] {
    var newBox = box
    switch side {
    case 0:
        watchUp(x: x, y: y, box: &newBox)
        watchRight(x: x, y: y, box: &newBox)
        
    case 1:
        watchRight(x: x, y: y, box: &newBox)
        watchDown(x: x, y: y, box: &newBox)
        
    case 2:
        watchDown(x: x, y: y, box: &newBox)
        watchLeft(x: x, y: y, box: &newBox)
        
    case 3:
        watchUp(x: x, y: y, box: &newBox)
        watchLeft(x: x, y: y, box: &newBox)
        
    default: break
    }
    
    return newBox
}

func watch4(side: Int, box: [[Int]], x: Int, y: Int) -> [[Int]] {
    
    var newBox = box
    switch side {
    case 0:
        watchUp(x: x, y: y, box: &newBox)
        watchRight(x: x, y: y, box: &newBox)
        watchLeft(x: x, y: y, box: &newBox)
        
    case 1:
        watchUp(x: x, y: y, box: &newBox)
        watchRight(x: x, y: y, box: &newBox)
        watchDown(x: x, y: y, box: &newBox)
        
    case 2:
        watchRight(x: x, y: y, box: &newBox)
        watchDown(x: x, y: y, box: &newBox)
        watchLeft(x: x, y: y, box: &newBox)
        
    case 3:
        watchUp(x: x, y: y, box: &newBox)
        watchDown(x: x, y: y, box: &newBox)
        watchLeft(x: x, y: y, box: &newBox)
        
    default: break
    }
    return newBox
}

func watch5(box: [[Int]], x: Int, y: Int) -> [[Int]] {
    var newBox = box
    
    watchUp(x: x, y: y, box: &newBox)
    watchRight(x: x, y: y, box: &newBox)
    watchDown(x: x, y: y, box: &newBox)
    watchLeft(x: x, y: y, box: &newBox)
    
    return newBox
}

func watchRight(x: Int, y: Int, box: inout [[Int]]) {
    var nextX = x+1
    while nextX < N && -1..<6 ~= box[nextX][y] {
        if box[nextX][y] == 0 { box[nextX][y] = -1 }
        nextX += 1
    }
}

func watchLeft(x: Int, y: Int, box: inout [[Int]]) {
    var prevX = x-1
    while 0 <= prevX && -1..<6 ~= box[prevX][y] {
        if box[prevX][y] == 0 { box[prevX][y] = -1 }
        prevX -= 1
    }
}

func watchUp(x: Int, y: Int, box: inout [[Int]]) {
    var prevY = y-1
    while 0 <= prevY && -1..<6 ~= box[x][prevY] {
        if box[x][prevY] == 0 { box[x][prevY] = -1 }
        prevY -= 1
    }
}

func watchDown(x: Int, y: Int, box: inout [[Int]]) {
    var nextY = y+1
    while nextY < M && -1..<6 ~= box[x][nextY] {
        if box[x][nextY] == 0 { box[x][nextY] = -1 }
        nextY += 1
    }
}
