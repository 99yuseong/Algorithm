// 무게가 "모두" 다른 N개의 구슬
// N은 홀수
// 무게 중간인 구슬을 찾자

// 양팔 저울
// M개의 쌍 > 

// 1 -> 2 -> 4
// 3 -> 4
// 1 -> 5

// return 중간 구슬이 될 수 없는 구슬의 개수

// N: 1~99개
// M: 5000천개 정보
struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { return inbox.isEmpty && outbox.isEmpty }
    mutating func append(_ k: T) { inbox.append(k) }
    mutating func removeFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func solution(_ n: Int, _ info: [[Int]]) -> Int {
    
    let M = (n+1)/2
    
    // heavy[i] = i보다 무거운 것들
    // light[i] = i보다 가벼운 것들
    var heavy: [Int: [Int]] = [:]
    var light: [Int: [Int]] = [:]

    for i in info {
        heavy[i[1], default: []].append(i[0])
        light[i[0], default: []].append(i[1])
    }
    
    var impossible = 0
    
    for i in 1...n {
        var visited = [Bool](repeating: false, count: n+1)
        var queue = Queue<Int>()
        var heavyCnt = 0
        var lightCnt = 0
        
        queue.append(i)
        visited[i] = true
        while !queue.isEmpty {
            let cur = queue.removeFirst()!
            for v in heavy[cur, default: []] {
                if !visited[v] {
                    queue.append(v)    
                    visited[v] = true
                    heavyCnt += 1
                }
            }
        }
        
        queue.append(i)
        while !queue.isEmpty {
            let cur = queue.removeFirst()!
            for v in light[cur, default: []] {
                if !visited[v] {
                    queue.append(v)
                    visited[v] = true
                    lightCnt += 1
                }
            }
        }
        
        if heavyCnt >= M || lightCnt >= M {
            impossible += 1
        }
    }
    
    return impossible
}

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0]
let M = NM[1]
var UV = [[Int]]()
for _ in 0..<M {
    UV.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
print(solution(N, UV))