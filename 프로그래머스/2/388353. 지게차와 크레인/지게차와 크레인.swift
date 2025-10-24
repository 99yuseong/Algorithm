import Foundation

// 물류창고

// 대문자로 종류 구분 n * m

// 출고요청 - 외부 1면과 접촉된 컨테이너를 모두 꺼냄

// 크레인 도입 - 외부 1면과 접촉 없어도 꺼냄

// "A" = 순간 접근 가능한 컨테이너만꺼냄
// "AA" = 모든 컨테이너 꺼냄

// storage: 컨테이너 정보
// requests: 출고 요청

// return 남은 컨테이너 수

// [제한사항]
// n = 2~50
// 총 너비는 4~2500칸

// m = 1~100
// 요청은 총 1~100건

// 1) 없는 요소를 요청할 수도 있음
// 2) 요청을 해도 못꺼낼 수 있음
// 3) 주변에 요소가 없는 것과 외부와 닿는 것은 다름

// [풀이]

// BFS
// 순회 O(2500) * 요청 O(100)

// BFS의 핵심은 전파에 있다.
    // 외부에 노출된 경우의 전파를 의미
    // 이 문제에서는 제거를 하면 = 외부 노출이 전파된다.
    
    // 1. 지게차로 제거한 경우 = 제거한 대상의 주위 요소가 1회 외부 노출로 전파된다.
    // 2. 크레인으로 제거한 경우 = 제거한 대상의 주위 요소가 외부 노출로 전파된다.

struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { inbox.isEmpty && outbox.isEmpty }
    mutating func append(_ x: T) { inbox.append(x) }
    mutating func removeFirst() -> T? { 
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}


func solution(_ storage:[String], _ requests:[String]) -> Int {
    
    let n = storage.count
    let m = storage.first!.count
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    // 1. [[String]]으로 변환
    var storage = storage.map { Array($0).map { String($0) } }
    
    // 2. 요청에 대해 제거 & 외부 노출 전파 처리
    var removed = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var outSide = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    for i in 0..<n {
        outSide[i][0] = true
        outSide[i][m-1] = true
    }
    
    for j in 0..<m {
        outSide[0][j] = true
        outSide[n-1][j] = true
    }
    
    for request in requests {
        
        let target = String(request.prefix(1))
        let usingCrain = request.count == 2
        
        var queue = Queue<[Int]>()
        
        for i in 0..<n {
            for j in 0..<m {
                
                if usingCrain { // 크레인을 사용하는 경우
                    
                    if !removed[i][j]               // 제거되지 않았고
                    && storage[i][j] == target {    // 타겟인 경우
                        
                        // 제거
                        removed[i][j] = true
                        
                        // 본인이 outside라면 전파 (만약 전파된 요소 또한 제거되었다면 그 주변도 전파)
                        if outSide[i][j] { 
                            queue.append([i ,j]) 
                            visited[i][j] = true
                        }
                        
                    }
                    
                } else { // 지게차를 사용하는 경우
                    
                    if !removed[i][j]           // 제거되지 않았고
                    && storage[i][j] == target  // 타겟이며
                    && outSide[i][j] {          // 외부에 노출된 경우
                        
                        // 제거
                        removed[i][j] = true
                        
                        // 모든 인접으로 1회 outside 전파
                        queue.append([i ,j])
                        visited[i][j] = true
                    }
                }
            }
        }
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()!
            
            for k in 0..<4 {
                let x = cur[0] + dx[k]
                let y = cur[1] + dy[k]
                
                if 0..<n ~= x && 0..<m ~= y 
                && !visited[x][y] {
                    
                    // 1회만 전파하는 경우 queue에 다시 넣지 않는다.
                    // 만약 해당 요소가 제거된 상태인 경우 queue에 추가한다. (크레인으로 인접한 여러 요소가 제거되는 경우)
                    if removed[x][y] { queue.append([x, y]) }
                    
                    visited[x][y] = true // 방문처리
                    outSide[x][y] = true // 전파
                }
            }
        }
    }
    
    return removed.map { $0.map { !$0 ? 1 : 0 }.reduce(0, +) }.reduce(0, +)
}