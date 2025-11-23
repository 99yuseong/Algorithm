import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)]
        // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index-1)])
    }
}

// n개의 노드와 n-1개의 간선 트리
// 0번노드가 루트
// 간선 가중치 없음
// 노드에는 정수
// 정수의 합을 최대로
// 루트 노드에서 시작해서 방문 노드 합의 최댓값

// [제한사항]
// node: 2~10만개
// 노드의 값은 음수일 수 있다.

// return 루트노드를 포함한 서브트리의 노드 합의 최댓값
// dp[i] = i번째 노드를 루트로하는 서브트리의 노드 합의 최댓값
// dp[i] = dp[i_1] + ... + dp[i_k] + nodes[i] (i_1 ... i_k는 i의 child 중 + 값인 경우)
// dp[k] = nodes[k] (k는 leaf)

// graph 생성 - O(10만)
// memoization으로 0번을 찾도록
// 모든 노드를 1회 방문 - O(10만)

func solution(_ nodes: [Int], _ edges: [[Int]]) -> Int {
    
    let n = nodes.count
    var graph: [Int: [Int]] = [:]
    for edge in edges {
        graph[edge[0], default: []].append(edge[1])
    }
    
    var dp = [Int](repeating: -100001, count: n)
    func memo(_ i: Int) -> Int {
        
        if dp[i] != -100001 { return dp[i] }
        
        if graph[i, default: []].isEmpty {
            dp[i] = nodes[i]
            return dp[i]
        }
        
        dp[i] = 0
        for k in graph[i]! {
            let subSum = memo(k)
            dp[i] += subSum > 0 ? memo(k) : 0
        }
        dp[i] += nodes[i]
        
        return dp[i]
    }
    
    return memo(0)
}

let file = FileIO()
let n = file.readInt()
var edges: [[Int]] = []
for _ in 0..<n-1 {
    edges.append([file.readInt(), file.readInt()])
}
let nodes = (0..<n).map { _ in file.readInt() }
print(solution(nodes, edges))
