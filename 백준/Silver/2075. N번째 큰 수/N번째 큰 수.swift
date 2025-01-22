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

// 1초
// 12MB -> Int 160만개 배열

// 자신의 한칸 위의 수보다 크다.

// N: 1~1500
// 총 2250000개의 수
// -10억 ~ 10억 사이의 정수

// N개의 배열에 1개씩 값을 추가 -> 이미 정렬된 배열
// N번째 큰 수까지 Max -> O(N^2)
let fIO = FileIO()

let N = fIO.readInt()
var heap = Heap()

// O(N^2)
for _ in 0..<N*N {
    heap.insert(fIO.readInt())
}

// O(NlgN)으로 출력
for _ in 0..<N-1 { _ = heap.pop() }
print(heap.pop()!)

struct Heap {
    var heap: [Int] = [0]
    var compare: (Int, Int) -> Bool = { $0 > $1 }
    
    mutating func heapify() {
        let startIdx = (heap.count-1) / 2
        
        for i in stride(from: startIdx, through: 1, by: -1) {
            swimUp(i)
        }
    }
    
    mutating func insert(_ k: Int) {
        if heap.isEmpty {
            heap.append(k)
            heap.append(k)
            return
        }
        
        heap.append(k)
        swimUp(heap.count-1)
    }
    
    mutating func swimUp(_ idx: Int) {
        var curIdx = idx
        
        while curIdx > 1 && compare(heap[curIdx], heap[curIdx/2]) {
            heap.swapAt(curIdx, curIdx/2)
            curIdx /= 2
        }
    }
    
    mutating func pop() -> Int? {
        if heap.count < 2 { return nil }
        if heap.count == 2 { return heap.removeLast() }
        
        heap.swapAt(1, heap.count-1)
        let result = heap.removeLast()
        swimDown(1)
        return result
    }
    
    mutating func swimDown(_ idx: Int) {
        var curIdx = idx
        
        while true {
            let left = curIdx * 2
            let right = curIdx * 2 + 1
            var swapIdx = curIdx
            
            if left < heap.count && compare(heap[left], heap[swapIdx]) {
                swapIdx = left
            }
            
            if right < heap.count && compare(heap[right], heap[swapIdx]) {
                swapIdx = right
            }
            
            if swapIdx != curIdx {
                heap.swapAt(curIdx, swapIdx)
                curIdx = swapIdx
            } else {
                break
            }
        }
    }
}


