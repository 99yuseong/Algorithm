// N명 
// 결혼식에 초대할 사람의 수

// n: 2~500명
// m: 1~10000줄
// 자신과 관계에 연결된 v의 개수는 몇개인가?

func solution(_ n: Int, _ a: [[Int]]) -> Int {
    
    var graph: [Int: [Int]] = [:]
    for item in a {
        graph[item[0], default: []].append(item[1])
        graph[item[1], default: []].append(item[0])
    }
    
    var invited = [Bool](repeating: false, count: n+1)
    for f in graph[1, default: []] {
        invited[f] = true
        for ff in graph[f, default: []] {
            if ff == 1 { continue }
            invited[ff] = true
        }
    } 
    return invited.map { $0 ? 1 : 0 }.reduce(0, +)
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var a: [[Int]] = []
for _ in 0..<m {
    a.append(readLine()!.split(separator: " " ).map { Int(String($0))! })
}
print(solution(n, a))