// n: 1~100개의 도시
// m: 1~10만개의 버스
// A -> B로 가는데 필요한 비용의 최솟값
func solution(_ n: Int, _ info: [[Int]]) -> String {
    
    let INF = Int.max/4
    var D = [[Int]](repeating: [Int](repeating: INF, count: n), count:n)
    var N = [[Int]](repeating: [Int](repeating: -1, count: n), count:n)
    
    for i in info {
        let (a, b, c) = (i[0]-1, i[1]-1, i[2])
        D[a][b] = min(D[a][b], c)
        N[a][b] = b
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if i == j { continue }
                if D[i][k] + D[k][j] < D[i][j] {
                    D[i][j] = D[i][k] + D[k][j]
                    N[i][j] = N[i][k]
                }
            }
        }
    }    
    
    var result = D.map {
        $0
        .map { $0 >= INF ? "0" : "\($0)" }
        .joined(separator: " ")
    }
    .joined(separator: "\n")
    
    result += "\n"
    
    for i in 0..<n {
        for j in 0..<n {
            if D[i][j] == 0 || D[i][j] == INF { 
                result += "0\n"
                continue
            }
            
            var path: [Int] = []
            var st = i
            while st != j {
                path.append(st)
                st = N[st][j]
            }
            path.append(j)
            result += "\(path.count) "
            result += "\(path.map { "\($0+1)" }.joined(separator: " "))\n"
        }
    }
    
    return result
}
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var info = [[Int]]()
for _ in 0..<m {
    info.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
print(solution(n, info))