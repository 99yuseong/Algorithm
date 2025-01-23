// 0.1초래!
// 128MB

// 정수를 하나 외칠 때마다 말한 수 중 중간 값
// 짝수개라면 중간에있는 두 수 중 작은 수
// N: 1~10만개의 자연수
// -1만~1만 사이 값

// MaxHeap, MinHeap 2개
// 첫 값을 MaxHeap에 넣고
// MaxHeap의 Top보다 크면 MinHeap, 작거나 같으면 MaxHeap에 insert
// 만약 MaxHeap과 MinHeap의 count가 2 이상 차이나면
// 큰 쪽에서 값을 빼서, 작은 쪽으로 insert
// 항상 MaxHeap의 Top을 출력

// 시간 복잡도는 O(N * 3 * lgN) -> O(NlgN)
// 공간 복잡도는 20만 Int 배열 -> 16MB

let N = Int(readLine()!)!
var maxHeap = Heap(compare: >)
var minHeap = Heap(compare: <)

let firstInput = Int(readLine()!)!
var result = "\(firstInput)\n"
maxHeap.insert(firstInput)
for _ in 1..<N {
    let input = Int(readLine()!)!
    if maxHeap.top! < input {
        minHeap.insert(input)
    } else {
        maxHeap.insert(input)
    }
    
    if maxHeap.count > minHeap.count + 1 {
        minHeap.insert(maxHeap.pop()!)
    }
    
    if maxHeap.count < minHeap.count {
        maxHeap.insert(minHeap.pop()!)
    }
    
    result += "\(maxHeap.top!)\n"
}
print(result)

struct Heap {
    var heap: [Int] = []
    var compare: (Int, Int) -> Bool
    
    init(compare: @escaping (Int, Int) -> Bool) {
        self.compare = compare
    }
    
    var top: Int? {
        if heap.count > 1 { return heap[1] }
        else { return nil }
    }
    
    var count: Int {
        if heap.count > 1 { return heap.count-1 }
        else { return 0 }
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

