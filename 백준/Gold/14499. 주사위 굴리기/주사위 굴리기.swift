// 크기가 N * M인지도
let NMxyK = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = NMxyK[0]
let M = NMxyK[1]
var x = NMxyK[2]
var y = NMxyK[3]
let K = NMxyK[4]
var map: [[Int]] = []
var dice = [
    [0],        // 0
    [0,0,0,0],  // 1
    [0]         // 2
]

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").compactMap { Int($0) })
}

// 주사위를 굴렸을 때,
// 이동한 칸에 쓰여 있는 수가 0이면,
// 주사위의 바닥면에 쓰여 있는 수가 칸에 복사된다.
// 0이 아닌 경우에는 칸에 쓰여 있는 수가 주사위의 바닥면으로 복사되며,
// 칸에 쓰여 있는 수는 0이 된다.

var roles = readLine()!.split(separator: " ").map { Int($0)! }

for role in roles {
    switch role {
    case 1:
        let newX = x
        let newY = y+1
        
        if 0..<N ~= newX && 0..<M ~= newY {
            roleEast()
            print(dice[1][1])
            x = newX
            y = newY
            
            if map[x][y] == 0 {
                map[x][y] = dice[1][3]
            } else {
                dice[1][3] = map[x][y]
                map[x][y] = 0
            }
        }
    case 2:
        let newX = x
        let newY = y-1
        
        if 0..<N ~= newX && 0..<M ~= newY {
            roleWest()
            print(dice[1][1])
            x = newX
            y = newY
            
            if map[x][y] == 0 {
                map[x][y] = dice[1][3]
            } else {
                dice[1][3] = map[x][y]
                map[x][y] = 0
            }
        }
    case 3:
        let newX = x-1
        let newY = y
        
        if 0..<N ~= newX && 0..<M ~= newY {
            roleNorth()
            print(dice[1][1])
            x = newX
            y = newY
            
            if map[x][y] == 0 {
                map[x][y] = dice[1][3]
            } else {
                dice[1][3] = map[x][y]
                map[x][y] = 0
            }
        }
    case 4:
        let newX = x+1
        let newY = y
        
        if 0..<N ~= newX && 0..<M ~= newY {
            roleSouth()
            print(dice[1][1])
            x = newX
            y = newY
            
            if map[x][y] == 0 {
                map[x][y] = dice[1][3]
            } else {
                dice[1][3] = map[x][y]
                map[x][y] = 0
            }
        }
    default:
        continue
    }
}

func roleEast() {
    let left = dice[0][0]
    let right = dice[2][0]
    dice[2][0] = dice[1][1]
    dice[0][0] = dice[1][3]
    dice[1][1] = left
    dice[1][3] = right
}

func roleWest() {
    let left = dice[0][0]
    let right = dice[2][0]
    dice[2][0] = dice[1][3]
    dice[0][0] = dice[1][1]
    dice[1][1] = right
    dice[1][3] = left
}

func roleNorth() {
    dice[1].append(dice[1].removeFirst())
}

func roleSouth() {
    dice[1].insert(dice[1].removeLast(), at: 0)
}
