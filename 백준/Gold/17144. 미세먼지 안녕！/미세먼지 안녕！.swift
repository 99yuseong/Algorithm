// 공기청정기
// R*C 격자판
// 공기 청정기는 항상 1번열 - 행은 상관없나? -> 2행을 차지
// 1. 미세먼지가 확장
//    - 인접한 상하좌우로 확산
//    - 공기청정기 or 경계 -> 확산 X / 미세먼지가 있어도 확산된다.
//    - A[r][c] / 5 양만큼 확산
//    - 남은 메시먼지는 A[r][c] - (A[r][c] / 5) * 5
//    - 소수점 처리 잘하기
// 2. 공기 청정기 작동
//    - 위쪽은 반시계방향 순환
//    - 아래쪽은 시계방향 순환
//    - 바람의 방향대로 모두 한칸씩 이동
// T초가 지난 후, 남아있는 미세먼지의 양

func solution(_ R: Int, _ C: Int, _ T: Int, _ A: [[Int]]) -> Int {
    // R: 행 6~50
    // C: 열 6~50
    // T: 시간 1~1000
    // A: -1 ~ 1000, -1은 공기청정기
    // 공기청정기는 위, 아래와 2칸 이상 떨어져 있다.
    
    // 1. T초를 loop 후, 최종 A배열의 미세먼지 합을 연산
    // 2. 미세먼지 확산 연산
    // 3. 공기 청정기로 순환 처리
    
    var map = A
    var airCon: [[Int]] = []
    
    for i in 2..<R-2 {
        if A[i][0] == -1 { airCon.append([i,0]) }
        if airCon.count == 2 { break }
    }
    
    func spread() {
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        
        var newMap = map
        
        for i in 0..<R {
            for j in 0..<C {
                if map[i][j] > 0 {
                    let spreadAmount = map[i][j] / 5
                    var spreadCnt = 0
                    
                    for k in 0..<4 {
                        let x = i + dx[k]
                        let y = j + dy[k]
                        
                        guard 0..<R ~= x && 0..<C ~= y && map[x][y] != -1 else {
                            continue
                        }
                        newMap[x][y] += spreadAmount
                        spreadCnt += 1
                    }
                    
                    newMap[i][j] -= spreadAmount * spreadCnt
                }
            }
        }
        
        map = newMap
    }
    
    func cleanAir() {
        // 2. 공기 청정기 작동
        //    - 위쪽은 반시계방향 순환
        //    - 아래쪽은 시계방향 순환
        //    - 바람의 방향대로 모두 한칸씩 이동
        let up = airCon[0][0]
        let down = airCon[1][0]
        
        for i in stride(from: up-1, through: 1, by: -1) { map[i][0] = map[i-1][0] }
        for j in 0..<C-1 { map[0][j] = map[0][j+1] }
        for i in 0..<up { map[i][C-1] = map[i+1][C-1] }
        for j in stride(from: C-1, through: 2, by: -1) { map[up][j] = map[up][j-1] }
        map[up][1] = 0
        
        for i in down+1..<R-1 { map[i][0] = map[i+1][0] }
        for j in 0..<C-1 { map[R-1][j] = map[R-1][j+1] }
        for i in stride(from: R-1, through: down+1, by: -1) { map[i][C-1] = map[i-1][C-1] }
        for j in stride(from: C-1, through: 2, by: -1) { map[down][j] = map[down][j-1] }
        map[down][1] = 0
    }
    
    for _ in 0..<T {
        spread()
        cleanAir()
    }
    
    var remained = 0
    for i in 0..<R {
        for j in 0..<C {
            if map[i][j] > 0 { remained += map[i][j] }
        }
    }
    return remained
}

let RCT = readLine()!.split(separator: " ").map { Int($0)! }
let R = RCT[0]
let C = RCT[1]
let T = RCT[2]
var A: [[Int]] = []
for _ in 0..<R {
    A.append(readLine()!.split(separator: " ").map { Int($0)! })
}
print(solution(R,C,T,A))
