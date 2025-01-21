// 2초
// 128MB

// 두 묶음의 숫자카드
// A + B번의 비교
// 정렬하고 연속합

// N: 1~10만개의 묶음
// 1000이하의 자연수 -> 최대 합 1억

// O(N) 또는 O(NlgN)

// 가장 작은 수 2개 합치기
// 합친 값 누적
// 그 다음 작은 수 2개 합치기


let N = Int(readLine()!)!
var heap = Heap<Int>(compare: <)

for _ in 0..<N {
    heap.insert(Int(readLine()!)!)
}

var result = 0
while heap.heap.count > 2 {
    let first = heap.pop()!
    let second = heap.pop()!
    let sum = first + second
    result += sum
    heap.insert(sum)
}
print(result)



struct Heap<T: Comparable> {
    var heap: [T] = []
    var compare: (T, T) -> Bool
    
    init(compare: @escaping (T, T) -> Bool) {
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
        if heap.count == 1 { return nil }
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

