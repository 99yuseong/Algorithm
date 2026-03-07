// V개의 마을과 E개의 도로로 구성되어 있는 도시
// 단방향 그래프
// 1~V 번호

// 싸이클. 길이가 최소가 되도록
// 길이의 합이 최소가 되는 싸이클
// 두마을을 왕복하는 경우도 싸이클
func solution(_ v: Int, _ info: [[Int]]) -> Int {
    // 불가능한 경우 -1
    
    // 싸이클 도로합이 최소. > a -> b -> a가 최소인 경로를 찾으면 된다.
    // 모든 x에 대하여 모든 y에 대하여 최소인 경로
    
    // D[x][y]로 플로이드 꼐산
    
    let INF = Int.max/4
    var D = [[Int]](repeating: [Int](repeating: INF, count: v+1), count: v+1)

    for i in info {
        let (a, b, d) = (i[0], i[1], i[2])
        D[a][b] = d // 여러번 주어지지 않는다.
    }
    
    for k in 1...v {
        for i in 1...v {
            for j in 1...v {
                D[i][j] = min(D[i][j], D[i][k] + D[k][j])
            }
        }
    }
    
    var d = INF
    for x in 1...v {
        for y in 1...v {
            d = min(d, D[x][y] + D[y][x])
        }
    }
    
    return d == INF ? -1 : d
}
let VE = readLine()!.split(separator: " ").map { Int(String($0))! }
let V = VE[0] // 400개
let E = VE[1] // 6400만
var info = [[Int]]()
for _ in 0..<E {
    info.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
print(solution(V, info))
