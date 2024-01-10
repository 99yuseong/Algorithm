import Foundation

/// control + D 눌러야 EOF로 command Line에서 실행 됨
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += Int(now)
            now = read()
        }
        
        return str
    }
}


let file = FileIO()
let n = file.readInt()
var queue: [Int] = []
var index: Int = 0
var answer: String = ""

for _ in 0..<n {
    let cmd = file.readString()

    switch cmd {
        case 335: // pop
            if queue.count == index {
                answer += "-1\n"
            } else {
                answer += "\(queue[index])\n"
                index += 1
            }
        case 443: // size
            answer += "\(queue.count - index)\n"
        case 559: // empty
            answer += queue.count == index ? "1\n": "0\n"
        case 553: // front
            answer += queue.count == index ? "-1\n" : "\(queue[index])\n"
        case 401: // back
            answer += queue.count == index ? "-1\n" : "\(queue.last!)\n"
        default: // push X
            queue.append(file.readInt())
    }
}

print(answer)

