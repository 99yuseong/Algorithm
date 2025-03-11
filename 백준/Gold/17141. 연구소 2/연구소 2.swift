// 특정 위치에 M개의 바이러스 -> 동시에 퍼진다.
// N*N 정사각형, 빈칸, 벽으로 구성
// 빈칸 > 바이러스 가능 / 바이러스는 상하좌우의 빈칸으로 복제
// 0: 빈칸, 1: 벽, 2: 바이러스를 놓을 수 있는 칸
// 2로 표시된 칸에 > 바이러스 전파
// 모든 칸에 빈 바이러스를 퍼트리는 최소시간

// 1. 2로 표시된 칸 중 M개를 선택
// 2. BFS로 모든 칸을 오염시키는 데 걸리는 시간 체크 (!! 퍼트릴 수 없을 수 있다.)
// N: 5~50
// M: 1~10
// 2는 M~10 -> nCm
// 퍼트릴 수 없는 경우 -1

// N: 사각형 크기, M: 퍼트리는 바이러스 개수
func solution(_ N: Int, _ M: Int, _ A: [[Int]]) -> Int {
    // 0. A를 돌면서 2 좌표 체크, -1로 표시, 0은 -1로표시
    // 1. 백트래킹으로 M개 선택하는 경우 체크
    // 2. BFS로 퍼지는 데 걸리는 시간 또는 -1
    // 3. 최소 시간 측정 / 모두 실패라면 -1리턴
    var starts: [[Int]] = []
    for i in 0..<N {
        for j in 0..<N {
            if A[i][j] == 2 {
                starts.append([i,j]) // 시작 가능 좌표
            }
        }
    }
    
    var ans = Int.max
    
    var selected: [[Int]] = []
    func brute(_ k: Int, _ start: Int) { // M개를 선택
        if k == M {
            let time = BFS()
            if time != -1 {
                ans = min(time, ans)
            }
            return
        }
        
        for i in start..<starts.count {
            selected.append(starts[i])
            brute(k+1, i+1)
            selected.removeLast()
        }
    }
    brute(0, 0)
    
    // O(N^2 * 3)
    func BFS() -> Int {
        // BFS()
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        var queue: [[Int]] = []
        var visited = Array(repeating: Array(repeating: -1, count: N), count: N)
        for i in 0..<N {
            for j in 0..<N {
                if A[i][j] == 1 {
                    visited[i][j] = -2 // 벽은 -2, 안 간곳 -1
                }
            }
        }
        // 시작 좌표 표시
        for start in selected {
            queue.append(start)
            visited[start[0]][start[1]] = 0
        }
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for i in 0..<4 {
                let x = cur[0] + dx[i]
                let y = cur[1] + dy[i]
                
                if 0..<N ~= x && 0..<N ~= y && visited[x][y] == -1 {
                    visited[x][y] = visited[cur[0]][cur[1]] + 1
                    queue.append([x, y])
                }
            }
        }
        
        var time = 0
        for i in 0..<N {
            for j in 0..<N {
                if visited[i][j] == -1 { return -1 }
                time = max(time, visited[i][j])
            }
        }
        
        return time
    }
    
    return ans == Int.max ? -1 : ans
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var A: [[Int]] = []
for _ in 0..<N {
    A.append(readLine()!.split(separator: " ").map { Int($0)! })
}
print(solution(N,M,A))
