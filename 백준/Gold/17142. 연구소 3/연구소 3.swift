// 바이러스, 활성/비활성 상태
// 처음 - 비활성, 활성 -> 상하좌우 빈칸으로 복제
// M개를 활성상태로 변경
// N*N 칸의 정사각형
// 0 -빈칸, 1-벽, 2-바이러스
// "활성바이러스가 비활성 바이러스를 만나면 비활성은 활성으로 변환"
// M: 활성시킬 개수
// 빈칸에 바이러스를 퍼뜨리는 최소시간
// 빈칸에 바이러스를 퍼트릴 수 없다면 -1 출력
func solution(_ N: Int, _ M: Int, _ A: [[Int]]) -> Int {
    // N: 4~50
    // M: 1~10
    // virus: M~10
    // 1. 모든 바이러스 중, 활성화시킬 바이러스 선택 -> 백트래킹 10C5 200이하
    var viruses: [[Int]] = []
    var selected = Set<[Int]>()
    var ans = Int.max
    
    findVirus()
    brute(0,0)
    
    func findVirus() {
        for i in 0..<N {
            for j in 0..<N {
                if A[i][j] == 2 { viruses.append([i,j]) }
            }
        }
    }
    
    func brute(_ k: Int, _ start: Int) {
        if k == M {
            let time = BFS()
            if time != -1 {
                ans = min(time, ans)
            }
            return
        }
        
        for i in start..<viruses.count {
            selected.insert(viruses[i])
            brute(k+1, i+1)
            selected.remove(viruses[i])
        }
    }
    
    func BFS() -> Int {
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        var visited = Array(repeating: Array(repeating: -1, count: N), count: N)
        var queue: [(x:Int, y:Int)] = []
        
        for virus in selected {
            queue.append((virus[0], virus[1]))
            visited[virus[0]][virus[1]] = 0 // 활성 0
        }
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            
            for i in 0..<4 {
                let x = cur.x + dx[i]
                let y = cur.y + dy[i]
                
                if 0..<N ~= x
                && 0..<N ~= y
                && visited[x][y] == -1
                && (A[x][y] == 0 || A[x][y] == 2) {
                    // 비활성 바이러스 활성화
                    if A[x][y] == 2 { queue.append((x,y)) }
                    queue.append((x,y))
                    visited[x][y] = visited[cur.x][cur.y] + 1
                }
            }
        }
        
        var t = 0
        for i in 0..<N {
            for j in 0..<N {
                if visited[i][j] == -1 && A[i][j] == 0 { return -1 }
                if visited[i][j] > t && A[i][j] == 0{
                    t = visited[i][j]
                }
            }
        }
        return t
    }
    
    
    // 2. BFS를 돌면서 바이러스 전파 -> 2500
    // 3. 빈칸 여부 확인
    return ans == Int.max ? -1 : ans
}
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var A: [[Int]] = []
for _ in 0..<N {
    A.append(readLine()!.split(separator: " ").map { Int($0)! })
}
print(solution(N,M,A))
