
// N*N
// 물고기 M마리, 상어 1마리
// 한 칸에는 최대 물고기 1마리
// 상어 크기 2, 인접한 칸으로 이동
// 같거나 작은 칸으로 이동가능
// 작은 물고기만 먹을 수 있다.

// 1. 더이상 먹을 수 있는 물고기가 없다 -> 엄마
// 2. 1마리라면 물고기 먹으러 이동
// 3. 1마리 이상 -> 가장 가까운 물고기로 이동
// 4. 거리 = 칸의 개수
// 5. 가장 위, 가장 왼쪽을 먼저먹는다.
// 6. 물고기 먹으면 빈칸 & 크기 1 증가
// 몇초 동안 물고기를 먹을 수 있나?
// N: 2~20
// 0 - 빈칸
// 1 2 3 4 5 6 - 물고기
// 9 - 아기 상어 위치
func solution(_ N: Int, _ A: [[Int]]) -> Int {

    // 1. 아기 상어 위치에서 BFS로 Visited에 거리를 매기면서 먹을 수 있는 물고기 찾기
    // 2. 먹을 수 있는 물고기 발견
        // 2-1. 1마리 OK
        // 2-2. 여러 마리 -> x좌표 작고, y좌표 작은 순 1순위 OK
        // 2-3. visited 값 추가, 상어 이동 & 크기 증가, & 물고기 제거
        // 2-4. 1번 반복
    // 3. 먹을 수 있는 물고기 없음 -> 종료 및 초 리턴
    var time = 0
    var A = A
    var sharkSize = 2
    var eatCnt = 0
    var shark: (x: Int, y: Int) = (-1,-1) // 상어 위치
    
    for i in 0..<N {
        for j in 0..<N {
            if A[i][j] == 9 {
                shark = (i,j)
                A[i][j] = 0
                break
            }
        }
    }
    
    let dx = [0,-1,0,1]
    let dy = [-1,0,1,0]

    while true {
        var queue: [(x: Int, y: Int)] = []
        var target: (x: Int, y: Int) = (-1, -1)
        var dist = Array(repeating: Array(repeating: -1, count: N), count: N)
        queue.append(shark)
        dist[shark.x][shark.y] = 0
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            
            for i in 0..<4 {
                let x = cur.x + dx[i]
                let y = cur.y + dy[i]
                
                if 0..<N ~= x
                    && 0..<N ~= y
                    && dist[x][y] == -1
                    && A[x][y] <= sharkSize {
                    
                    queue.append((x,y))
                    dist[x][y] = dist[cur.x][cur.y] + 1
                    
                    if 1..<sharkSize ~= A[x][y] {
                        if target.x == -1
                            || dist[x][y] < dist[target.x][target.y]
                            || dist[x][y] == dist[target.x][target.y]
                            && (x < target.x || target.x == x && y < target.y) {
                            
                            target = (x,y)
                        }
                    }
                }
            }
        }
        
        if target.x == -1 {
            return time
        } else {
            time += dist[target.x][target.y]
            eatCnt += 1
            if eatCnt == sharkSize {
                sharkSize += 1
                eatCnt = 0
            }
            A[target.x][target.y] = 0
            shark = target
        }
    }
}

let N = Int(readLine()!)!
var A: [[Int]] = []
for _ in 0..<N {
    A.append(readLine()!.split(separator: " ").map { Int($0)! })
}
print(solution(N,A))
