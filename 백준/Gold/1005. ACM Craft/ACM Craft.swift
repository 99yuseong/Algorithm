import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
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

// 매 시작시 건물을 짓는 순서가 주어진다.
// 건설 - 완성까지 Delay가 존재한다.
// 가장 빨리지을때 걸리는 최소시간

// N: 2~1천
// K: 1~10만 edge
// X,Y,W : 1~1천
// t: 0~10만

// 1. 그래프로 변환 -> O(10만)
// DP[i]: 건물 i를 짓는데 걸리는 최소 시간
// DP[i] = max(DP[i_1], ... , DP[i_k]) + T[i]

func solution(_ N: Int, _ times: [Int], _ edges: [[Int]], _ W: Int) -> Int {
    
    var graph: [Int: [Int]] = [:]
    for edge in edges {
        graph[edge[1], default: []].append(edge[0])
    }
    
    var DP = [Int](repeating: -1, count: N+1)
    
    func memo(_ i: Int) -> Int{
        if DP[i] != -1 { return DP[i] }
        if graph[i, default: []].isEmpty { return times[i] }
        
        for node in graph[i]! {
            DP[i] = max(DP[i], memo(node))
        }
        DP[i] += times[i]
        return DP[i]
    }
    
    return memo(W)
}

let fileIO = FileIO()

let T = fileIO.readInt()
var ans = ""
for _ in 0..<T {
    let N = fileIO.readInt()
    let K = fileIO.readInt()
    let times = [0] + (0..<N).map { _ in fileIO.readInt() }
    var edges: [[Int]] = []
    for _ in 0..<K {
        let edge = [fileIO.readInt(), fileIO.readInt()]
        edges.append(edge)
    }
    let W = fileIO.readInt()
    ans += "\(solution(N, times, edges, W))\n"
}
print(ans)
