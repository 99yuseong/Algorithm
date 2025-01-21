// 1초
// 256MB

// 절댓값 힙
// 배열에 0이 아닌 정수
// 절댓값이 가장 작은 값을 출력 후, 값을 배열에서 제거
// 절댓값이 가장 작은 값이 여러개일경우 가장 작은수를 출력, 값을 배열에서 제거

// N: 1~10만 -> O(N) 또는 O(NlgN)
// 0이 아닌 정수 -> 추가
// 0 -> 제거
// 만약 비어있을 경우 0을 출력

// compare에서 abs(A) == abs(B) ? A < B : abs(A) < abs(B)를 사용
struct Heap {
    var heap: [Int] = []
    var compare: (Int, Int) -> Bool = { a, b in
        abs(a) != abs(b) ? abs(a) < abs(b) : a < b
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

let N = Int(readLine()!)!
var heap = Heap()

for _ in 0..<N {
    let input = Int(readLine()!)!
    
    if input == 0 {
        print(heap.pop() ?? 0)
    } else {
        heap.insert(input)
    }
}
 