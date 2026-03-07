// 일방통행 가능 길이 늘고 있다.
// 공학관 > 종합관 존재하지 않는다.

// 양방향으로 바꿔야만 하는 길이 몇개인가?
func solution(_ n: Int, _ info: [[Int]], _ questions: [[Int]]) -> [Int] {
    
    // 0이면 일방 통행, 1이면 양방향
    // 길은 최대 한 개

    // 1. 갈 수 있냐 여부 체크 - 최단 경로 만들면 INF인 곳은 못가는 곳
    // 2. 3만개 질문 연산

    // 갈수있으면 비용 0, 못가면 비용 1
    let INF = Int.max/4
    var D = [[Int]](repeating: [Int](repeating: INF, count: n+1), count: n+1)
    
    for i in info {
        let (u, v, b) = (i[0], i[1], i[2])
        if b == 0 { // 일방 통행
            D[u][v] = 0
            D[v][u] = 1
        } else {
            D[u][v] = 0
            D[v][u] = 0    
        }
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if i == j { D[i][j] = 0; continue }
                D[i][j] = min(D[i][j], D[i][k] + D[k][j])
            }
        }
    }
    
    return questions.map { D[$0[0]][$0[1]] }
}
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0] // 250
let m = nm[1] // 137500
var info = [[Int]]()
for _ in 0..<m {
    info.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
let k = Int(readLine()!)!
var questions = [[Int]]()
for _ in 0..<k {
    questions.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
print(solution(n, info, questions).map { String($0) }.joined(separator: "\n"))
