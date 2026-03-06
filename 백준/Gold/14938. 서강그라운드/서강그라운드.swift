// 아이템의 최대 개수
// 거리가 15이내의 모든 지역의 아이템 습득
func solution(_ m: Int, _ items: [Int], _ infos: [[Int]]) -> Int {
    // 모든 시작지에서 얻을 수 있는 최대 아이템 개수 연산 필요
    // 100개 내외 > 플로이드 100^3
    // 최단 경로로 m안에 있는 시작지 확인 -> 아이템 ++
    
    // 1. 최단 거리 연산
    // 2. 1~n까지 최단거리 m이하 filter, 아이템 개수 ++, 최대와 비교
    
    let n = items.count
    let INF = Int.max/4
    var FW = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)
    
    for i in infos {
        let (a, b, c) = (i[0]-1, i[1]-1, i[2])
        FW[a][b] = min(FW[a][b], c)
        FW[b][a] = min(FW[a][b], c)
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if i == j { FW[i][j] = 0; continue }
                FW[i][j] = min(FW[i][j], FW[i][k] + FW[k][j])
            }
        }
    }
    
    var maxItems = 0
    for i in 0..<n {
        var curItems = 0
        for j in 0..<n {
            if FW[i][j] <= m {
                curItems += items[j]
            }
        }
        maxItems = max(maxItems, curItems)
    }
    
    return maxItems
}

let nmr = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmr[0]
let m = nmr[1]
let r = nmr[2]
let items = readLine()!.split(separator: " ").map { Int(String($0))! }
var infos = [[Int]]()
for _ in 0..<r {
    infos.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
print(solution(m, items, infos))