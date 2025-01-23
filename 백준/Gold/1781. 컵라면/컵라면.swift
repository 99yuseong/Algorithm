// 2초
// 256MB -> 4200만개 Int

// N개의 문제
// 풀면 몇개의 컵라면을 준다.

// 데드라인도 있다.
// 최대 컵라면의 수
// 문제 푸는 데 1시간
// 데드라인은 N이하의 자연수
// 컵라면 수는 Int안으로

// N: 1~20만개 -> O(N) 이나 O(NlgN)
// 데드라인 / 컵라면수

// 우선 순위 큐
// 데드라인이 작고, 컵라면이 큰 순서대로 우선 순위
// var DeadLine = 0으로 카운트
// while !heap.isEmpty

// deadline보다 값이 작거나 같으면 pop
// 크면 컵라면 ++, deadline ++

// 입력 -> N번 insert -> O(NlgN)
// 총 N번 pop을 하니까 -> O(NlgN)

let N = Int(readLine()!)!
var heap = Heap()
var A: [[Int]] = Array(repeating: [], count: N+1)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    A[input[0]].append(input[1])
}

var totalCup = 0
for i in stride(from: N, through: 1, by: -1) {
    for num in A[i] {
        heap.insert(num)
    }
    
    if heap.isEmpty { continue }
    totalCup += heap.pop()!
}
print(totalCup)

struct Heap {
    var heap: [Int] = []
    var compare: (Int, Int) -> Bool = { h1, h2 in
        h1 > h2
    }
    
    var top: Int? {
        if isEmpty { return nil }
        else { return heap[1] }
    }
    
    var isEmpty: Bool {
        heap.count < 2
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
    
    @discardableResult
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
            
            if curIdx != swapIdx {
                heap.swapAt(curIdx, swapIdx)
                curIdx = swapIdx
            } else {
                break
            }
        }
    }
}



