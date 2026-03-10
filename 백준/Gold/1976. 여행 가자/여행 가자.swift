// 경로가 가능할까
// 연결되어 있을까가 중요

func solution(_ n: Int, _ m: Int, _ roads: [[Int]], _ plan: [Int]) -> Bool {
    
    // Union-Find
    
    // plan은 한 그룹인가?  
    // Union-Find > parent 배열 .filter { in plan } > 모두 같은지 체크
    
    var parent = [Int](repeating: -1, count: n)
    func find(_ a: Int) -> Int {
        if parent[a] < 0 { return a }
        parent[a] = find(parent[a])
        return parent[a]
    }
    func union(_ a: Int, _ b: Int) {
        var x = find(a)
        var y = find(b)
        if x == y { return }
        if parent[y] < parent[x] { swap(&x, &y) }
        parent[x] += parent[y]
        parent[y] = x
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if roads[i][j] == 1 { union(i, j) }
        }
    }
    
    return Set(plan.map { find($0-1) }).count == 1
}
let N = Int(readLine()!)! // 200개 이하
let M = Int(readLine()!)!
var roads = [[Int]]()
for _ in 0..<N { roads.append(readLine()!.split(separator: " ").map { Int(String($0))! }) }
var plan = readLine()!.split(separator: " ").map { Int(String($0))! }
print(solution(N, M, roads, plan) ? "YES" : "NO")