// 맞닿아 있는 극이 다르면 반대방향으로 회전
// 톱니바퀴는 총 8개

// 12시 방향부터 시계방향으로 주어진다.
// N극은 0 S극은 1

// 다섯번째 줄에는 회전횟수 K 1 <= k <= 100

// 톱니바퀴 번호, 1 > 시계방향, -1 > 반시계방향

var wheel: [[Int]] = []

for _ in 0..<4 {
    wheel.append(Array(readLine()!).map { Int(String($0))! })
}

let K = Int(readLine()!)!
var indices: [[Int]] = [
    [0, 2, 0],
    [0, 2, 6],
    [0, 2, 6],
    [0, 0, 6]
]

for _ in 0..<K {
    let WR = readLine()!.split(separator: " ").compactMap { Int($0) }
    let W = WR[0]-1
    let R = WR[1]
    
    var rotation = Array(repeating: 0, count: 4)
    rotation[W] = R
    
    var right = W
    var rightR = R
    while checkRight(w: right) {
        rotation[right+1] = rightR * (-1)
        right += 1
        rightR = rightR * (-1)
    }
    var left = W
    var leftR = R
    while checkLeft(w: left) {
        rotation[left-1] = leftR * (-1)
        left -= 1
        leftR = leftR * (-1)
    }
    
    // 회전 적용
    for i in 0..<4 {
        if rotation[i] == 1 {
            // 시계 방향 회전
            wheel[i].insert(wheel[i].removeLast(), at: 0)
        } else if rotation[i] == -1 {
            // 반시계 방향 회전
            wheel[i].append(wheel[i].removeFirst())
        }
    }
}

var ans = 0
for i in 0..<4 {
    var s = wheel[i][indices[i][0]]
    for _ in 0..<i { s = s * 2 }
    ans += s
}
print(ans)

func checkRight(w: Int) -> Bool {
    guard w+1 <= 3 else { return false }
    
    return wheel[w][indices[w][1]] != wheel[w+1][indices[w+1][2]]
}

func checkLeft(w: Int) -> Bool {
    guard w-1 >= 0 else { return false }
    
    return wheel[w][indices[w][2]] != wheel[w-1][indices[w-1][1]]
}
