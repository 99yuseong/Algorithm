// 힙
// 최대 힙
// 1. 자연수 x를 넣는다.
// 2. 가장 큰 값을 출력하고, 제거한다.
// 비어있는 배열에서 시작

// N: 1~10만 연산 개수
// x가 자연수 -> 값을 넣는 연산
// x가 0    -> 가장 큰 값을 출력하고 제거하는 경우
// 자연수 < 2^31
// -> 0이 주어진 횟수만큼 값을 출력
// 만약 비어있는데, 가장 큰 값이라면 -> 0을 출력

func solution(_ N: Int, _ A: [Int]) -> String {
    // 큰 값을 출력하는 자료구조 -> MaxHeap
    
    // 1. A를 루프를 돌면서 MaxHeap에 값 추가
    // 0이라면 MaxHeap에서 값 pop
    
    struct Heap {
        var heap: [Int] = []
        var compare: (Int, Int) -> Bool = { $0 > $1 }
        
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
                    heap.swapAt(swapIdx, curIdx)
                    curIdx = swapIdx
                } else {
                    break
                }
            }
        }
    }
    
    var maxHeap = Heap()
    var ans = ""
    for a in A {
        if a == 0 { ans += "\(maxHeap.pop() ?? 0)\n" }
        else { maxHeap.insert(a) }
    }
    return ans
}

let N = Int(readLine()!)!
var A: [Int] = []
for _ in 0..<N {
    A.append(Int(readLine()!)!)
}
print(solution(N,A))
