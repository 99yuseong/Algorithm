import Foundation

// N*N 크기의 정사각형 지형
// 숫자 = 높이

// 모든 칸을 탐험
// 상하좌우 이동 - 높이차가 height이하

// height 초과 시 사다리 사용 = 비용

// return 사다리 설치 비용 최솟값

// [제한사항]
// N: 4~300
// AREA: 16~9만
// h: 1~1만

// 1. BFS로 돌면서 땅을 분리 (1,2,3...) - O(9만)
    // 맞닿은 땅의 높이차가 height 이하 -> queue
    // 맞닿은 땅의 높이차가 height 초과 -> [x1, y1, x2, y2, cost] push

// 2. 영역(정점) - 간선(높이차가 height 초과인 상하좌우) = cost가 최소인 MST
    // 크루스칼 알고리즘    
    // [x1, y1, x2, y2, cost]을 cost 순으로 정렬 - O(9만 * 4)
    // union-find로 minCost 계산

func solution(_ land:[[Int]], _ height:Int) -> Int {
    
    let N = land.count
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var coord = [[Int]]()
    var visited = [[Int]](repeating: [Int](repeating: -1, count: N), count: N)
    var curAREA = 0
    
    for i in 0..<N {
        for j in 0..<N {
            if visited[i][j] < 0 {
                curAREA += 1
                
                var queue = [[Int]]()
                queue.append([i,j])
                visited[i][j] = curAREA
                
                while !queue.isEmpty {
                    let cur = queue.removeFirst()
                    
                    for k in 0..<4 {
                        let x = cur[0] + dx[k]
                        let y = cur[1] + dy[k]
                        
                        guard 0..<N ~= x && 0..<N ~= y else { continue }
                        
                        if visited[x][y] < 0 {
                            let cost = abs(land[cur[0]][cur[1]] - land[x][y])
                            if cost <= height {
                                queue.append([x, y])
                                visited[x][y] = curAREA
                            } else {
                                coord.append([cur[0], cur[1], x, y, cost])
                            }
                        } 
                    }
                }
            }
        }
    }
    
    var parent = [Int](repeating: -1, count: curAREA+1)
    
    func find(_ a: Int) -> Int {
        if parent[a] < 0 { return a }
        parent[a] = find(parent[a])
        return parent[a]
    }
    
    func union(_ a: Int, _ b: Int) -> Bool {
        var x = find(a)
        var y = find(b)
        
        if x == y { return false }
        
        if parent[y] < parent[x] {
            swap(&x, &y)
        }
        
        if parent[x] == parent[y] {
            parent[x] -= 1
        }
        parent[y] = x
        return true
    }
    
    var sorted = coord.sorted { $0[4] < $1[4] }
    var minCost = 0
    var latter = 0
    
    for c in sorted {
        
        let area1 = visited[c[0]][c[1]]
        let area2 = visited[c[2]][c[3]]
        
        if union(area1, area2) {
            minCost += c[4]
            latter += 1
        }
        
        if latter == curAREA-1 {
            break
        }
    }
    
    return minCost
}













