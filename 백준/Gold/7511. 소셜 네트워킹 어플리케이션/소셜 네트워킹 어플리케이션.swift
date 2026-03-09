// 친구 or not

func solution(_ n: Int, _ friendShip: [[Int]], _ questions: [[Int]]) -> [Int] {
    
    // 친구냐 아니냐
    // 1. BFS: O(mlogk): 그룹별 분리 - 확인
    // 2. Union-Find
    
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
        if parent[x] == parent[y] { parent[x] -= 1 }
        parent[y] = x
    }
    
    for r in friendShip { 
        union(r[0], r[1]) 
    }
    return questions.map { find($0[0]) == find($0[1]) ? 1 : 0 }
}

for i in 1...Int(readLine()!)! {
    let n = Int(readLine()!)! // 1~10만명의 유저
    let k = Int(readLine()!)! // 1~1만개의 관계
    var friendShip = [[Int]]()
    for _ in 0..<k {
        friendShip.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    let m = Int(readLine()!)! // 1만개의 쌍
    var questions = [[Int]]()
    for _ in 0..<m {
        questions.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    print("Scenario \(i):")
    print(solution(n, friendShip, questions).map { String($0) }.joined(separator: "\n") + "\n")
}