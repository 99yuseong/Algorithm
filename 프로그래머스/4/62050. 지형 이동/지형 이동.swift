import Foundation

// 숫자 = 높이

// 모든 칸을 방문하는 탐험

// height 이하의 높이 차만 이동 가능

// 사다리 설치 = 높이 차 비용

// return 사다리 설치 비용 최솟값

// N: 4~300
// 9만칸
// 높이: 1~1만

// 1. BFS로 땅을 돌면서 영역을 마킹 - 1, 2, 3, 4 ... O(N^2)
// 2. 전체 땅을 돌면서 O(N^2)
    // 방문하지 않은 땅이라면
    // 인접한 동일한 영역의 땅의 주변에서 1) 영역이 다르고, 2) height보다 차이가 큰 땅인경우 => 최소 차이를 등록
    // 최소 비용 ++


import Foundation

func solution(_ land:[[Int]], _ height:Int) -> Int {
    let N = land.count
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    // 1. BFS로 영역 구분
    var area = Array(repeating: Array(repeating: 0, count: N), count: N)
    var areaCount = 0
    
    for i in 0..<N {
        for j in 0..<N {
            if area[i][j] == 0 {
                areaCount += 1
                var queue = [[i, j]]
                area[i][j] = areaCount
                
                var idx = 0
                while idx < queue.count {
                    let cur = queue[idx]
                    idx += 1
                    
                    for k in 0..<4 {
                        let x = cur[0] + dx[k]
                        let y = cur[1] + dy[k]
                        guard 0..<N ~= x, 0..<N ~= y else { continue }
                        
                        if area[x][y] == 0 && abs(land[cur[0]][cur[1]] - land[x][y]) <= height {
                            area[x][y] = areaCount
                            queue.append([x, y])
                        }
                    }
                }
            }
        }
    }
    
    // 2. 영역 간 간선 정보 수집
    var edges: [(Int, Int, Int)] = [] // (cost, a, b)
    for i in 0..<N {
        for j in 0..<N {
            for k in 0..<4 {
                let x = i + dx[k]
                let y = j + dy[k]
                guard 0..<N ~= x, 0..<N ~= y else { continue }
                
                let a = area[i][j]
                let b = area[x][y]
                if a != b {
                    let cost = abs(land[i][j] - land[x][y])
                    edges.append((cost, a, b))
                }
            }
        }
    }
    
    // 3. 간선을 비용 기준 정렬
    edges.sort { $0.0 < $1.0 }
    
    // 4. Union-Find로 MST 구성
    var parent = Array(0...areaCount)
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    func union(_ a: Int, _ b: Int) {
        let pa = find(a), pb = find(b)
        if pa != pb { parent[pa] = pb }
    }
    
    var totalCost = 0
    for (cost, a, b) in edges {
        if find(a) != find(b) {
            union(a, b)
            totalCost += cost
        }
    }
    
    return totalCost
}