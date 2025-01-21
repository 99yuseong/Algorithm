struct Heap<T: Comparable> {
    var heap: [T] = []
    var compare: (T,T) -> Bool
        
    init(compare: @escaping (T,T) -> Bool) {
        self.compare = compare
    }
    
    mutating func insert(_ k: T) {
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
    
    mutating func pop() -> T? {
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
var minHeap = Heap<Int>(compare: <)

for _ in 0..<N {
    let input = Int(readLine()!)!
    
    if input == 0 {
        print(minHeap.pop() ?? 0)
    } else {
        minHeap.insert(input)
    }
}
    
