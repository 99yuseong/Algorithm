// n * n 크기의 대나무숲
// 먹고 상하좌우로 이동
// 대나무는 더 많아져야함

// 판다가 최대한 많은 칸을 방문하려면 어떤 경로?

// n*n: 1~100만

// 우선 모든 칸을 테스트 해봐야함.
// 왜냐하면 모든 칸에서 어떤 방향으로 이동하는 지에 따라 결정됨
// 100만 * 4 * 4 * .... 모든 경우의 수를 따지기엔 너무 많음

// 방문의 최대값은 100만, 하지만 경로는 매우 많다.

// DP로 해당 지점에서 시작한 경로의 최댓값을 담아야한다.
// [초기값] 상하좌우보다 값이 모두 크다면 1

// 1. DP를 -1로 초기화
// 2. DP[x][y] = if SOOP[x][y] < 상하좌우 -> max(DP 상하좌우)
// 2. SOOP을 돌면서 초기값 세팅
// 3. 채우는 순서가 매우 복잡하다. Top-Down으로

func solution(_ SOOP: [[Int]]) -> Int {

    let n = SOOP.count
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var DP = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
    var maxEat = 1
    
    func memo(_ x: Int, _ y: Int) -> Int {
        if DP[x][y] != -1 { return DP[x][y] }
        
        var maxEat = 1
        for k in 0..<4 {
            let x1 = x + dx[k]
            let y1 = y + dy[k]
            
            if 0..<n ~= x1 && 0..<n ~= y1 && SOOP[x][y] < SOOP[x1][y1] {
                maxEat = max(maxEat, memo(x1, y1) + 1)
            }
        }
        
        DP[x][y] = maxEat
        return maxEat
    }
    
    for i in 0..<n {
        for j in 0..<n {
            maxEat = max(maxEat, memo(i,j))
        }
    }
    
    return maxEat
}

let n = Int(readLine()!)!
var SOOP = [[Int]]()
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    SOOP.append(line)
}
print(solution(SOOP))
