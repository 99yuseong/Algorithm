import Foundation

func solution(_ operations: [String]) -> [Int] {
    var minHeap = Heap<Int>(<)
    var maxHeap = Heap<Int>(>)
    var validSet = Set<Int>() // 현재 큐에 남아있는 유효한 값 저장
    var len = 0
    
    for operation in operations {
        let input = operation.split(separator: " ").map { String($0) }
        let op = input[0]
        let num = Int(input[1])!
        
        switch op {
        case "I":
            minHeap.enqueue(num)
            maxHeap.enqueue(num)
            validSet.insert(num)
            len += 1
        case "D":
            if len > 0 { // 큐가 비어있을 때 삭제 연산 무시
                if num == -1 { // 최솟값 삭제
                    while let minTop = minHeap.top, !validSet.contains(minTop) {
                        _ = minHeap.dequeue() // 유효하지 않은 값 제거
                    }
                    if let minTop = minHeap.dequeue() {
                        validSet.remove(minTop)
                        len -= 1
                    }
                } else { // 최댓값 삭제
                    while let maxTop = maxHeap.top, !validSet.contains(maxTop) {
                        _ = maxHeap.dequeue() // 유효하지 않은 값 제거
                    }
                    if let maxTop = maxHeap.dequeue() {
                        validSet.remove(maxTop)
                        len -= 1
                    }
                }
            }
        default:
            break
        }
        
        if len == 0 { // 큐가 비었으면 초기화
            minHeap.removeAll()
            maxHeap.removeAll()
            validSet.removeAll()
        }
    }
    
    if len == 0 {
        return [0, 0]
    } else {
        while let maxTop = maxHeap.top, !validSet.contains(maxTop) {
            _ = maxHeap.dequeue()
        }
        while let minTop = minHeap.top, !validSet.contains(minTop) {
            _ = minHeap.dequeue()
        }
        return [maxHeap.top!, minHeap.top!]
    }
}

// Heap 구조체 정의 (1-based index 사용)
struct Heap<T: Comparable> {
    var heap: [T] = []
    var compare: (T, T) -> Bool
    
    init(_ compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    var top: T? {
        return heap.count > 1 ? heap[1] : nil
    }
    
    mutating func enqueue(_ k: T) {
        if heap.isEmpty {
            heap.append(k) // 0번 인덱스는 사용하지 않음
            heap.append(k)
            return
        }
        
        heap.append(k)
        swimUp(heap.count - 1)
    }
    
    mutating func swimUp(_ index: Int) {
        var curIdx = index
        while curIdx > 1 && compare(heap[curIdx], heap[curIdx / 2]) {
            heap.swapAt(curIdx, curIdx / 2)
            curIdx /= 2
        }
    }
    
    mutating func dequeue() -> T? {
        if heap.count < 2 { return nil }
        if heap.count == 2 { return heap.popLast() }
        
        heap.swapAt(1, heap.count - 1)
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
                heap.swapAt(swapIdx, curIdx)
                curIdx = swapIdx
            } else {
                break
            }
        }
    }
    
    mutating func removeAll() {
        heap = []
    }
}