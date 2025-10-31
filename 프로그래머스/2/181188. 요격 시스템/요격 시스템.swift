import Foundation

// 요격 시스템
// 최소 운영으로 요격

// 2차원 공간
// 끝 지점으로는 요격 불가

// 요격미사일은 정수가 아니라 실수에서도 발사 가능

// 필요한 요격 미사일의 최솟값

// targets.count = 1~50만
// 범위 = 0 ~ 1억

// O(N) or O(NlgN)



// 1. s < e는 무조건 관통할 수 있다.
// 2. 최솟값? 
// 최솟값은 최대한 많은 꼬챙이를 끼우면서 나간다

// 확인해야할 꼬챙이

// 확인해야할 건, 최대 1억개 위치를 확인해야함.
// 근데 1억개 위치에서 추가되는 꼬챙이 인덱스

// 1. 겹쳐지는 부분만 생각하면 안됨 - 안겹치는 부분을 제외할때 순서가 애매해짐

// 무식하게
// 1. 0~1억 배열
// 2. 50만 * 50만

// 그리디
// 1. 정렬 (시작점이 빠르고, 끝점이 빠른 것 기준)
// 2. 큐에 해당 범위 담기
// 3. 큐에서 pop, while 해당 범위의 끝 지점보다 작은 시작지점을 가진것까지 pop
    // count ++
// O(NlgN) + O(N) + O(N)

struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { inbox.isEmpty && outbox.isEmpty }
    var first: T? { outbox.isEmpty ? inbox.first : outbox.last }
    mutating func append(_ x: T) { inbox.append(x) }
    mutating func removeFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func solution(_ targets:[[Int]]) -> Int {
    
    var targets = targets.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
    
    var queue = Queue<[Int]>()
    var shotCount = 0
    
    for target in targets { 
        queue.append(target) 
    }
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()!
        var start = cur[0]
        var end = cur[1]
        
        while !queue.isEmpty && queue.first![0] < end {
            end = min(end, queue.first![1])
            queue.removeFirst()!
        }
        
        shotCount += 1
    }
    
    return shotCount
}

















