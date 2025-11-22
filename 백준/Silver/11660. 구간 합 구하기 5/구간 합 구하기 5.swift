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

// 11:44분 시작
// 순서대로 연산하기

// dp[i][j] = (0, 0) ~ (i, j)까지의 누적합
// dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + map[i][j]

// dp[k][0] = dp[k-1][0] + map[i][0]
// dp[0][k] = dp[0][k-1] + map[0][k]

// (x1, y1) - (x2, y2)
// dp[x2][y2] - dp[x1-1][y2] - dp[x2][y2-1] + dp[x1-1][y1-1]



func solution(_ map: [[Int]], _ cmds: [(x1: Int, y1: Int, x2: Int, y2: Int)]) -> [Int] {
    
    let N = map.count
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: N+1), count: N+1)
    
    for i in 1...N {
        dp[i][1] = dp[i-1][1] + map[i-1][1]
        dp[1][i] = dp[1][i-1] + map[1][i-1]
    }
    
    for i in 1...N {
        for j in 1...N {
            dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + map[i-1][j-1]
        }
    }
    
    var ans: [Int] = []
    
    for cmd in cmds {
        let (x1, y1, x2, y2) = cmd
        ans.append(dp[x2][y2] - dp[x1-1][y2] - dp[x2][y1-1] + dp[x1-1][y1-1])
    }
    
    return ans
}

let file = FileIO()
let N = file.readInt()
let M = file.readInt()
var map: [[Int]] = []
for _ in 0..<N {
    let line = (0..<N).map { _ in file.readInt() }
    map.append(line)
}
var cmd: [(x1: Int, y1: Int, x2: Int, y2: Int)] = []
for _ in 0..<M {
    let line = (0..<4).map { _ in file.readInt() }
    cmd.append((line[0], line[1], line[2], line[3]))
}
print(solution(map, cmd).map { String($0) }.joined(separator: "\n"))
