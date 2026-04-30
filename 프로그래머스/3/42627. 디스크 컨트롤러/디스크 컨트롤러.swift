struct Heap<T> {
    var heap: [T] = []
    var first: T? { 
        if isEmpty { return nil }
        return heap[1]
    }
    var isEmpty: Bool { heap.count < 2 }
    var compare: (T,T) -> Bool
    init(_ compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    mutating func heappush(_ item: T) {
        if heap.isEmpty { 
            heap.append(item)
            heap.append(item)
            return
        }
        heap.append(item)
        swimUp(heap.count-1)
    }
    mutating func swimUp(_ idx: Int) {
        var curIdx = idx
        while curIdx / 2 >= 1 && compare(heap[curIdx], heap[curIdx/2]) {
            heap.swapAt(curIdx/2, curIdx)
            curIdx /= 2
        }
    }
    
    mutating func heappop() -> T? {
        if heap.count < 2 { return nil }
        if heap.count == 2 { return heap.popLast() }
        
        let result = heap[1]
        heap.swapAt(1, heap.count-1)
        _ = heap.popLast()
        swimDown(1)
        return result
    }
    
    mutating func swimDown(_ idx: Int) {
        var curIdx = idx
        
        while true {
            var targetIdx = curIdx
            let leftIdx = curIdx * 2
            let rightIdx = curIdx * 2 + 1
            
            if leftIdx < heap.count && compare(heap[leftIdx], heap[targetIdx]) {
                targetIdx = leftIdx
            }
            
            if rightIdx < heap.count && compare(heap[rightIdx], heap[targetIdx]) {
                targetIdx = rightIdx
            }
            
            if targetIdx != curIdx {
                heap.swapAt(targetIdx, curIdx)
                curIdx = targetIdx
            } else {
                break
            }
        }
    }
}


import Foundation

// 한번에 하나의 작업
// 우선순위 디스크 컨트롤러

// 대기큐 [작업번호, 요청시각, 소요시간]
// 1. 우선순위가 높은 작업 > 하드디스크 진행
//    소요시간 짧을 수록 > 요청시각 빠를 수록 > 작업번호가 작을 수록

// 2. 한번에 1개의 작업만

// 반환시간 = 작업요청 ~ 종료까지 걸린시간

// [요청, 소요시간]

// return avg(반환시간)

// jobs: 500개
// [요청 시각, 소요시간]

// 1000초에 1000초 걸리는 게 500개
// 최대 시간 50억초


// 1. 요청 시각 순서대로 정렬
// 2. 요청과 종료 시각마다 loop 연산

// heap 사용
    // 대기큐 : heap
    // 

func solution(_ jobs:[[Int]]) -> Int {
    
    var queue = Heap<(rqTime: Int, wkTime: Int, jobNo: Int)> { 
        if $0.rqTime == $1.rqTime && $0.wkTime == $1.wkTime { return $0.jobNo < $1.jobNo }
        return $0.wkTime == $1.wkTime ? $0.rqTime < $1.rqTime : $0.wkTime < $1.wkTime
    }
    
    var hardDisk: [[Int]] = [] // (finish_time, rqTime, jobNo)
    
    var sortedJobs: [[Int]] = []
    for (idx, job) in jobs.enumerated() { sortedJobs.append([job[0], job[1], idx]) }
    sortedJobs.sort { $0[0] > $1[0] } // [요청 시각, 소요시간]
    
    var t = sortedJobs.last![0]
    
    var result: [Int] = []
    
    while !sortedJobs.isEmpty || !queue.isEmpty || !hardDisk.isEmpty {
        
        // 현재시각에 가능한 모든 작업 대기큐로 이동
        while !sortedJobs.isEmpty && sortedJobs.last![0] <= t {
            let job = sortedJobs.popLast()!
            queue.heappush((rqTime: job[0], wkTime: job[1], jobNo: job[2]))
        }
        
        if !hardDisk.isEmpty && hardDisk.last![0] <= t {
            let job = hardDisk.popLast()!
            result.append(job[0] - job[1])
        }
            
        if hardDisk.isEmpty {
            
            if queue.isEmpty {
                // 하드디스크가 가능 but 작업 없다면 > 작업 있는 시간으로 이동
                if !sortedJobs.isEmpty {
                    t = sortedJobs.last![0]
                }
                
            } else {
                // 하드디스크가 가능하면 > 작업 부여
                let (rqTime, wkTime, jobNo) = queue.heappop()!
                hardDisk.append([t+wkTime, rqTime, jobNo]) // (finish_time, rqTime, jobNo)  
            }
                    
        } else {
            // 하드디스크가 불가능 > 끝나는 시간으로 이동
            t = hardDisk.last![0]
        }
    }
    
    return result.reduce(0, +) / result.count
}