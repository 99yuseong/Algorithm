import Foundation

func solution(_ jobs: [[Int]]) -> Int {
    var jobs = jobs.sorted { $0[0] < $1[0] } // 요청 시간 기준 정렬
    var PQ = Heap<[Int]> { $0[1] < $1[1] } // 소요시간 기준 최소 힙
    
    var curT = 0 // 현재 시간
    var returnTimes = 0 // 총 반환 시간
    var idx = 0 // jobs 탐색 인덱스
    let jobCount = jobs.count // 전체 작업 개수

    while idx < jobCount || !PQ.isEmpty {
        // 현재 시간(curT)까지 요청된 작업들을 힙에 추가
        while idx < jobCount && jobs[idx][0] <= curT {
            PQ.insert(jobs[idx])
            idx += 1
        }
        
        if !PQ.isEmpty {
            let job = PQ.pop()!
            curT += job[1] // 작업 수행
            returnTimes += curT - job[0] // 요청부터 완료까지 걸린 시간
        } else {
            // 현재 진행할 작업이 없으면 다음 요청 시간으로 이동
            curT = jobs[idx][0]
        }
    }
    
    return returnTimes / jobCount
}

// 우선순위 디스크 컨트롤러
// 번호, 요청 시각, 소요시간
// 가장 우선순위가 높은 작업
// 1. 소요시간 짧은 것, 요청시각 빠른것, 번호가 작은것
// 해당 작업만 수행

// input: [ [요청시간, 소요시간] ]
// 모든 요청 작업의 반환시간 평균
// (반환시간 - 요청시간)의 평균

// jobs: 1~500개
// 요청시간: 0~1000
// 소요시간: 1~1000

// Heap을 구현, Compare: ([s,l], [s,l]) -> { if/else }
// curT = 0
// returnTimes = 0
// 1. pop하고, O(lgN)
// 시간 업데이트 curT = max(work[0], curT) + work[1]
// returnTime += curT - work[0]

// 2. 최종 returnTimes/jobs.count

struct Heap<T> {
    var heap: [T] = []
    var compare: (T, T) -> Bool
    
    var isEmpty: Bool {
        heap.count < 2
    }
    
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
    
    private mutating func swimUp(_ idx: Int) {
        var curIdx = idx
        
        while curIdx > 1 && compare(heap[curIdx], heap[curIdx/2]) {
            heap.swapAt(curIdx, curIdx/2)
            curIdx /= 2
        }
    }
    
    mutating func pop() -> T? {
        if heap.count < 2 { return nil }
        if heap.count == 2 { return heap.popLast() }
        
        heap.swapAt(1, heap.count-1)
        let result = heap.removeLast()
        swimDown(1)
        return result
    }
    
    private mutating func swimDown(_ idx: Int) {
        var curIdx = idx
        
        while true {
            var swapIdx = curIdx
            var left = curIdx * 2 
            var right = curIdx * 2 + 1
            
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

















