func solution(_ N: Int, _ L: Int, _ R: Int, _ A: [[Int]]) -> Int {
    var move = 0
    var total: [Int] = []
    var opened: [Int] = []
    var connected: [[Int]] = []
    var A = A
    
    let dx = [-1,0,1,0]
    let dy = [0,-1,0,1]
    
    while true {
        total = []
        opened = []
        connected = Array(repeating: Array(repeating: -1, count: N), count: N)
        var visited = Array(repeating: Array(repeating: false, count: N), count: N)
        var hasMoved = false
        
        // O(2500) - BFS 실행
        for i in 0..<N {
            for j in 0..<N {
                if visited[i][j] { continue } // 이미 방문한 경우 패스
                
                var queue = [[i, j]]
                visited[i][j] = true
                connected[i][j] = opened.count
                opened.append(1)
                total.append(A[i][j])
                
                var index = 0
                
                while index < queue.count {
                    let cur = queue[index]
                    index += 1
                    
                    for d in 0..<4 {
                        let x = cur[0] + dx[d]
                        let y = cur[1] + dy[d]
                        
                        if 0..<N ~= x, 0..<N ~= y, !visited[x][y], L...R ~= abs(A[cur[0]][cur[1]] - A[x][y]) {
                            visited[x][y] = true
                            queue.append([x, y])
                            connected[x][y] = connected[cur[0]][cur[1]]
                            opened[connected[cur[0]][cur[1]]] += 1
                            total[connected[cur[0]][cur[1]]] += A[x][y]
                            hasMoved = true
                        }
                    }
                }
            }
        }
        
        if !hasMoved { break } // 국경이 단 한 번도 열리지 않으면 종료
        
        // O(2500) - 인구 이동 수행
        for i in 0..<N {
            for j in 0..<N {
                if connected[i][j] != -1 {
                    A[i][j] = total[connected[i][j]] / opened[connected[i][j]]
                }
            }
        }
        
        move += 1
    }
    
    return move
}

// 입력 처리
let NLR = readLine()!.split(separator: " ").map { Int($0)! }
let N = NLR[0]
let L = NLR[1]
let R = NLR[2]
var A: [[Int]] = []

for _ in 0..<N {
    A.append(readLine()!.split(separator: " ").map { Int($0)! })
}

print(solution(N,L,R,A))
