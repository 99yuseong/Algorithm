// 뿌요뿌요

// 여러 색깔의 뿌요를 배치
// 최대한 아래로 떨어진다.

// 같은 색 뿌요가 4개 이상으로 연결되어 있으면 한꺼번에 없어짐
// 1연쇄가 시작

// 이후 중력의 영향을 받아 차례로 떨어진다.

// 다시 같은 색 뿌요가 4개 이상이 모이게 되면 또 터짐
// 여러 그룹이 터질 수 있다면 동시에 터지고, 이때도 1번의 연쇄로 취급

// 상대방의 필드에서 몇 번 연속으로 연쇄가 나올 것인가.





// 총 12개의 줄
// 6개의 문자

// .은 빈공간
// R G B P Y의 색상

// 12 * 6
// 1. 4개 이상의 뿌요가 상하좌우로 연결된 경우를 찾고, 해당 공간을 .으로 변환한다.
// 2. 뿌요가 된 x 좌표를 저장한다.
// 3. 뿌요가 된 x 좌표의 .이 필터링된 배열을 만들며 .으로 할당하고, 뿌요를 할당한다.
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var map: [[Character]] = []
var stack: [[Int]] = []
var visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
var changed = Array(repeating: false, count: 6)
var ans = 0

for _ in 0..<12 {
    map.append(Array(readLine()!))
}

while true {
    visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
    changed = Array(repeating: false, count: 6)
    
    for i in 0..<12 {
        for j in 0..<6 {
            if map[i][j] != "." && !visited[i][j] {
                visited[i][j] = true
                stack.append([i,j])
                let puyos = bfs()
                
                if puyos.count >= 4 {
                    for puyo in puyos {
                        map[puyo[0]][puyo[1]] = "."
                        changed[puyo[1]] = true
                    }
                }
            }
        }
    }
    
    var isGravity = false
    for i in 0..<6 { if changed[i] { isGravity = true } }
    
    if isGravity {
        gravity()
        ans += 1
    } else {
        break
    }
}
print(ans)

func bfs() -> [[Int]] {
    var puyo = [stack.first!]
    
    while !stack.isEmpty {
        let cur = stack.removeFirst()
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if 0..<12 ~= x && 0..<6 ~= y
                && !visited[x][y]
                && map[x][y] == map[cur[0]][cur[1]]
            {
                stack.append([x, y])
                visited[x][y] = true
                puyo.append([x,y])
            }
        }
    }
    
    return puyo
}


func gravity() {
    for j in 0..<6 {
        var puyos: [Character] = []
        
        if changed[j] {
            
            for i in 0..<12 {
                if map[i][j] != "." {
                    puyos.append(map[i][j])
                    map[i][j] = "."
                }
            }
            
            for k in 0..<puyos.count {
                map[11-k][j] = puyos.removeLast()
            }
        }
    }
}
