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

// 1. [String] > [[String]]으로 변환 O(2500)
// 2. request 마다 BFS 순회를 돌면서 제거
    // 존재 = 1 (no visited)
    // 노출됨 = 0 (no visited & can 지게차) 
    // 제거됨 = -1 (visited & not 지게차)
    // 외부와 맞닿음 = -2 (visited & can 지게차)

    // "A" : 길이 1 request = 주변에 -2 또는 인덱스가 넘어가는 경우 > -2 표기
    // "AA": 길이 2 request = 주변에 -2 또는 인덱스가 넘어가는 경우 > -2 표기 or -1 표기


func solution(_ storage:[String], _ requests:[String]) -> Int {
    
    let n = storage.count
    let m = storage.first!.count
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    // 1. [[String]]으로 변환
    var storage = storage.map { Array($0).map { String($0) } }
    
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
        
        var queue = [[Int]]()
        
        for i in 0..<n {
            for j in 0..<m {
                if usingCrain {
                    if !removed[i][j] && storage[i][j] == target {
                        // 본인 혹은 인접이 outside라면 전파
                        if outSide[i][j] { 
                            queue.append([i ,j]) 
                            visited[i][j] = true
                        }
                        removed[i][j] = true
                    }
                    
                } else {
                    if !removed[i][j] && storage[i][j] == target && outSide[i][j] {
                        // 추가된 모든 인접으로 outside 전파
                        queue.append([i ,j])
                        visited[i][j] = true
                        removed[i][j] = true
                    }
                }
            }
        }
        
        // 추가된 모든 인접으로 outside 전파
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            
            for k in 0..<4 {
                let x = cur[0] + dx[k]
                let y = cur[1] + dy[k]
                
                if 0..<n ~= x && 0..<m ~= y && !visited[x][y] {
                    if removed[x][y] { queue.append([x, y]) }
                    visited[x][y] = true
                    outSide[x][y] = true
                }
            }
        }
    }
    
    return removed.map { $0.map { !$0 ? 1 : 0 }.reduce(0, +) }.reduce(0, +)
}