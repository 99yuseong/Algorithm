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
// 0.5초
// 메모리 256MB

// 팰린드롬
// 자연수 N개 1 ~ 2000개 / 1 ~ 10만 사이 값
// 질문 M번 1 ~ 100만번
// 1 <= S E <= N
// S~E번째 수가 팰린드롬인가?

let file = FileIO()

let N = file.readInt()
var A = [0] + (0..<N).map { _ in file.readInt() }
let M = file.readInt()
var D = Array(repeating: Array(repeating: false, count: N+1), count: N+1)

// D[i][j]: i~j까지 팰린드롬 여부
// D[i][j] = A[i] == A[j] && D[i+1][j-1] (i + 1 < j)
// D[i][j] = true (i == j)
// D[i][j] = A[i] == A[j] (i + 1 == j)

for i in 1...N {
    D[i][i] = true
}

for i in 1..<N {
    if A[i] == A[i+1] {
        D[i][i+1] = true
    }
}

for i in stride(from: N-2, through: 1, by: -1) {
    for j in i+2...N {
        D[i][j] = A[i] == A[j] && D[i+1][j-1]
    }
}

var answer = ""
for _ in 0..<M {
    let (S, E) = (file.readInt(), file.readInt())
    
    answer += (D[S][E] == true ? "1\n" : "0\n")
}
print(answer)
