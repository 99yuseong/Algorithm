// R*C의 땅
// 상어 1칸, 크기와 속도
// 낚시왕은 (0,-1)에 위치, (0,6)에 도달하면 멈춘다.

// 1. 오른쪽으로 1칸 이동
// 2. 해당 열에서 가장 가까운 상어를 잡는다.(상어 제거)
// 3. 상어가 이동
//    - 상어는 주어진 속도로 이동
//    - 경계에 도달하면 방향을 바꿔서 이동
// 4. 이동 후에는 한 칸에 여러 상어가 있을 수 있다.
//    큰 상어가 나머지르 모두 잡아먹는다.
// 낚시 왕이 잡은 상어크기 합 출력

func solution(_ R: Int, _ C: Int, _ M: Int, Sharks: [[Int]]) -> Int {
    // R: 2~100 세로 크기
    // C: 2~100 가로 크기
    // M: 0~10000 상어 수
    // Sharks: [x, y, speed, direction, size]
    // x: 1~R
    // y: 1~C
    // s: 0~1000
    // d: 1: 위, 2: 아래, 3: 오른쪽, 4: 왼쪽
    // z: 1~10000
    
    // 1. C번동안 Loop
    // 2. catchShark(): x좌표가 가장 작은 상어제거 & 상어 크기 계산
    // 3. moveShark(): 모든 상어를 이동
        // 3-1. 속도와 뱡향으로 이동
        // 3-1. 이미 상어가 있다면 큰 상어로 업데이트
    
    var totalSharkSize = 0
    var map: [[[Int]]] = Array(repeating: Array(repeating: [], count: C), count: R)
    var curPosistions = Set<[Int]>()
    
    for shark in Sharks {
        map[shark[0]-1][shark[1]-1] = [shark[2], shark[3], shark[4]]
        curPosistions.insert([shark[0]-1, shark[1]-1])
    }
    
    for j in 0..<C {
        catchShark(at: j)
        moveShark()
    }
    
    func catchShark(at j: Int) {
        for i in 0..<R {
            if curPosistions.contains([i,j]) {
                totalSharkSize += map[i][j].last!
                curPosistions.remove([i,j])
                map[i][j] = []
                break
            }
        }
    }
    
    func moveShark() {
        var newMap: [[[Int]]] = Array(repeating: Array(repeating: [], count: C), count: R)
        var newPositions = Set<[Int]>() // 현재 위치 리셋
        
        for pos in curPosistions {
            let curShark = map[pos[0]][pos[1]]
            let s = curShark[0]
            var d = curShark[1]
            let size = curShark[2]
            var x = pos[0]
            var y = pos[1]
            
            if d == 1 || d == 2 { // 위(1), 아래(2) 이동
                    let cycle = (R - 1) * 2
                    var distance = s % cycle

                    while distance > 0 {
                        if d == 1 { // 위로 이동
                            if x - distance >= 0 {
                                x -= distance
                                break
                            } else {
                                distance -= x
                                x = 0
                                d = 2 // 방향 반전 (아래로)
                            }
                        } else { // 아래로 이동
                            if x + distance < R {
                                x += distance
                                break
                            } else {
                                distance -= (R - 1 - x)
                                x = R - 1
                                d = 1 // 방향 반전 (위로)
                            }
                        }
                    }
            } else { // 왼쪽(4), 오른쪽(3) 이동
                let cycle = (C - 1) * 2
                var distance = s % cycle
                
                while distance > 0 {
                    if d == 4 { // 왼쪽 이동
                        if y - distance >= 0 {
                            y -= distance
                            break
                        } else {
                            distance -= y
                            y = 0
                            d = 3 // 방향 반전 (오른쪽으로)
                        }
                    } else { // 오른쪽 이동
                        if y + distance < C {
                            y += distance
                            break
                        } else {
                            distance -= (C - 1 - y)
                            y = C - 1
                            d = 4 // 방향 반전 (왼쪽으로)
                        }
                    }
                }
            }
            
            if newPositions.contains([x,y]) {
                if newMap[x][y].last! < size {
                    newMap[x][y] = [s,d,size]
                }
            } else {
                newPositions.insert([x,y])
                newMap[x][y] = [s,d,size]
            }
        }
        
        map = newMap
        curPosistions = newPositions
    }
    
    return totalSharkSize
}

let RCM = readLine()!.split(separator: " ").map { Int($0)! }
let R = RCM[0]
let C = RCM[1]
let M = RCM[2]
var Sharks: [[Int]] = []
for _ in 0..<M {
    Sharks.append(readLine()!.split(separator: " ").map { Int($0)! })
}
print(solution(R, C, M, Sharks: Sharks))
