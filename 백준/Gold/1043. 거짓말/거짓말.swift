// 과장되게
// N명 + 진실을 아는 사람
// 모든 파티 참가

// 과장된 이야기를 할 수 있는 파티의 최댓값

// 50명의 사람 50개의 파티
// 진실을 아는 사람이 낀 무리와 아닌 무리

// party를 돌면서 index 기반으로 graph 생성
    // 해당 party에 truth가 contains하는 가?

func solution(_ n: Int, _ truth: [Int], _ party: [[Int]]) -> Int {
    
    if truth.isEmpty { return party.count }
    
    let truth = Set(truth)
    let party = party.map { Set($0) }

    var graph: [Int: [Int]] = [:]
    
    // 50 * 50
    for i in 0..<party.count {    
        for j in i+1..<party.count {
            if party[i].intersection(party[j]).count > 0 {
                graph[i, default: []].append(j)
                graph[j, default: []].append(i)
            }
        }
    }
    
    var visited = [Bool](repeating: false, count: party.count)
    var freeTalk = 0
    
    for i in 0..<party.count {
        if visited[i] { continue }
        
        var queue = [Int]()
        var totalParty = 0
        var needTruth = false

        queue.append(i)
        visited[i] = true
        totalParty += 1
        if party[i].intersection(truth).count > 0 { 
            needTruth = true 
        }
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for v in graph[cur, default: []] {
                if !visited[v] {
                    if party[v].intersection(truth).count > 0 { 
                        needTruth = true 
                    }
                    queue.append(v)
                    visited[v] = true
                    totalParty += 1
                }
            }
        }

        if !needTruth { 
            freeTalk += totalParty
        }
    }

    return freeTalk
}
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]
let KNUM = readLine()!.split(separator: " ").map { Int(String($0))! }
let K = KNUM[0]
let NUM = Array(KNUM[1...])
var party = [[Int]]()
for _ in 0..<M {
    let knum = readLine()!.split(separator: " ").map { Int(String($0))! }
    party.append(Array(knum[1...]))
}
print(solution(N,NUM,party))