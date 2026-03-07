// 친구, 서로 다른 도시에 사는 중
// 일방 통행 

// 왕복 시간 = 자신이 살고 있는 도시 > X > 자신 도시
// 갈수 있는 도시만
// 모든 친구들이 갈 수 있는 최대 시간이 최소가 되도록
// 1개 이상을 보장
func solution(_ n: Int, _ infos: [[Int]], _ cities: [Int]) -> [Int] {
    
    // 200개의 도시
    // K명
    // E는 약 4만개의 경로
    
    // 1. 플로이드 > D[x][y] : x > y까지 소요시간
    // O(200만)
    
    let INF = Int.max/4
    var D = [[Int]](repeating: [Int](repeating: INF, count: n+1), count: n+1)
    
    for info in infos {
        let (x, y, t) = (info[0], info[1], info[2])
        D[x][y] = min(D[x][y], t)
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if i == j { D[i][j] = 0; continue }
                D[i][j] = min(D[i][j], D[i][k] + D[k][j])
            }
        }
    }
    
    // 1~N 도시를 x로 선언
        // i_x + x_i 경로 최대를 연산. 최소를 갱신
    var minT = Int.max/4
    var X: [Int] = []
    
    out: for x in 1...n {
        var maxT = -1
        
        for city in cities {
            if D[city][x] + D[x][city] >= INF {
                continue out
            }
            maxT = max(maxT, D[city][x] + D[x][city])
        }
        
        if maxT < minT {
            X = [x]
            minT = maxT
        } else if maxT == minT {
            X.append(x)
        } else {
            continue
        }
    }
    return X.sorted { $0 < $1 }
}
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0] 
let M = NM[1]
var infos = [[Int]]()
for _ in 0..<M {
    infos.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
let K = Int(readLine()!)!
let cities = readLine()!.split(separator: " ").map { Int(String($0))! }
print(solution(N, infos, cities).map { String($0) }.joined(separator: " "))