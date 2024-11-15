// 청소하는 영역의 개수
// N * M 크기의 방의 크기
// 벽 또는 빈칸
// 청소기는 동서남북중 한 방향을 보고 있다.
// (0,0)
//         ...
//                (N-1,M-1)
// 빈칸은 모두 청소되지 않은 상태


// 청소안된경우 청소
// 주변 4칸중 청소 안된 경우 없을땐
// -> 현재 방향 유지하고 한칸 후진
// 후진할 수 없다면 정지

// 빈칸이 있는 경우
// 반시계방향으로 90도 회전
// 청소되지 않은 빈칸인 경우 전진

// 3 <= N,M <= 50 - 최대 2500 크기
// 로봇청소기 좌표와 바라보는 방향
//      0
//    3   1
//      2

// 0 -> 빈칸
// 1 -> 벽
// 가장자리는 모두 벽이다.
// 청소기는 항상 빈칸에 위치한다.

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
let rcD = readLine()!.split(separator: " ").map { Int($0)! }
var cleaner = [rcD[0], rcD[1], rcD[2]] // [r, c, 보는 방향]
var map: [[Int]] = []
for i in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var cleanCnt = 0

var isNearCleanNeeded: Bool {
    let x = cleaner[0]
    let y = cleaner[1]
    
    return map[x-1][y] == 0 || map[x+1][y] == 0 || map[x][y-1] == 0 || map[x][y+1] == 0
}

var isFrontCleanNeeded: Bool {
    let x = cleaner[0]
    let y = cleaner[1]
    
    switch cleaner[2] {
    case 0:
        return map[x-1][y] == 0
    case 1:
        return map[x][y+1] == 0
    case 2:
        return map[x+1][y] == 0
    default: // 3
        return map[x][y-1] == 0
    }
}

var isBackWall: Bool {
    let x = cleaner[0]
    let y = cleaner[1]
    
    switch cleaner[2] {
    case 0:
        return map[x+1][y] == 1
    case 1:
        return map[x][y-1] == 1
    case 2:
        return map[x-1][y] == 1
    default: // 3
        return map[x][y+1] == 1
    }
}

var isNotCleaned: Bool {
    map[cleaner[0]][cleaner[1]] == 0
}

var isCleaned: Bool {
    map[cleaner[0]][cleaner[1]] == 2
}

func clean() {
    map[cleaner[0]][cleaner[1]] = 2
    cleanCnt += 1
}

func go() {
    switch cleaner[2] {
    case 0:
        cleaner[0] -= 1
    case 1:
        cleaner[1] += 1
    case 2:
        cleaner[0] += 1
    default: // 3
        cleaner[1] -= 1
    }
}

func rotate() {
    cleaner[2] = (4 + cleaner[2] - 1) % 4
}

func back() {
    switch cleaner[2] {
    case 0:
        cleaner[0] += 1
    case 1:
        cleaner[1] -= 1
    case 2:
        cleaner[0] -= 1
    default: // 3
        cleaner[1] += 1
    }
}

while true {
    if isNotCleaned {
        clean()
    }
    
    if isNearCleanNeeded {
        In: for _ in 0..<4 {
            rotate()
            if isFrontCleanNeeded {
                go()
                break In
            }
        }
    } else {
        if isBackWall {
            break
        } else {
            back()
        }
    }
}
print(cleanCnt)
