// 사과를 먹으면 뱀 길이가 늘어난다.
// 뱀이 기어다니다가 벽 / 자신 몸 부딪히면 게임 끝

// N*N 보드위에서 진행
// 사과 있음
// 보드 상하좌우 끝에는 벽
// (1,1) 벽 안쪽 맨위, 맨좌측
// 뱀 길이는 1
// 방향은 처음엔 오른쪽

// 몸 길이를 늘려 다음칸
// 벽, 몸 부딪히면 끝
// 사과있으면 사과 없어지고 꼬리는 그대로
// 사과가 없다면 꼬리를 비운다.

// 몇초안에 끝나는가

// 2 <= N <= 100 -> 최대 1만칸
// 0 <= K <= 100 -> 사과의 개수 K

let N = Int(readLine()!)!
let K = Int(readLine()!)!
var apple: [[Int]] = []
for _ in 0..<K {
    apple.append(readLine()!.split(separator: " ").map { Int($0)! - 1 })
}
let L = Int(readLine()!)! // 방향 변환 횟수
var move: [[Int]] = []
for _ in 0..<L {
    let input = readLine()!.split(separator: " ")
    move.append([Int(input[0])!, input[1] == "D" ? 1 : -1])
}

var snake: [[Int]] = [[0,0]]
var time = 0
var D = 1

func rotate(to d: Int) {
    if d == 1 { // 시계뱡항
        D = (D + 1) % 4
    } else { // 반시계 방향
        D = (4 + D - 1) % 4
    }
}

var front: [Int] {
    let x = snake.last![0]
    let y = snake.last![1]
    
    switch D {
    case 0:
        return [x-1, y]
    case 1:
        return [x, y+1]
    case 2:
        return [x+1, y]
    default: // 3
        return [x, y-1]
    }
}

func checkIsWall(_ rc: [Int]) -> Bool {
    rc[0] < 0 || rc[1] < 0 || rc[0] > N-1 || rc[1] > N-1
}

while true {
    time += 1
    
    if checkIsWall(front) || snake.contains(front) {
        break
    }
    
    snake.append(front)
    if let index = apple.firstIndex(of: snake.last!) {
        apple.remove(at: index)
    } else {
        snake.removeFirst()
    }
    
    if !move.isEmpty && move.first![0] == time {
        rotate(to: move.removeFirst()[1])
    }
}
print(time)