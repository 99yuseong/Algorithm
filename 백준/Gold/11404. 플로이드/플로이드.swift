// n개의 도시 2~100
// m개의 버스 1~10만
// 모든 a -> b로 가는 비용의 최솟값

func solution(_ n: Int, _ info: [[Int]]) -> String {
    
    var graph: [Int: [(v: Int, c: Int)]] = [:]
    for i in info {
        let (a, b, c) = (i[0], i[1], i[2])
        graph[a, default: []].append((b, c))
    }
    
    let INF = Int.max/4
    var D = [[Int]](repeating: [Int](repeating: INF, count: n+1), count: n+1)

    for i in 1...n {
        for (j, c) in graph[i, default: []] {
            D[i][j] = min(D[i][j], c)
        }
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if i == j { continue }
                D[i][j] = min(D[i][k] + D[k][j], D[i][j])            
            }
        }
    }
    
    return D[1...n]
        .map { 
            Array($0[1...n])
                .map { $0 == INF ? "0" : "\($0)" } 
                .joined(separator: " ")
        }
        .joined(separator: "\n")
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var infos = [[Int]]()
for _ in 0..<m {
    infos.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
print(solution(n, infos))