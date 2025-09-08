// 회전 가능, 뒤집기 불가

// 무조건 꽉차야한다! 

// n: 3~50 => 9~2500칸
// 0=빈칸, 1=채워진칸
// 최대 1~6칸 블럭 = 6*6 블럭 좌표로 표현

// 최대 채울 수 있는 칸을 리턴

// N: 9~2500

// board
// 1. table -> 블럭을 찾는다. O(N)
    // BFS = 인접한 땅을 찾는다
// 2. 찾은 블럭을 회전시킬 수 있는 방식으로 변경 -> O(N * 36)
    // 좌표 배열 -> 최소 x, 최소 y값을 빼면 6*6 상자에 모두 들어가는 구조
    // 회전 ->[M-1-y][x]
// 3. 회전 후, 2500 칸을 이동해가면서 주변이 0인 경우로 넣기 -> O(N * 4 * N * N)

import Foundation

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {

    let blocks = findBlocks(table, for: 1)
    let emptys = findBlocks(game_board, for: 0)
    
    var isUsed = Array(repeating: false, count: blocks.count)
    var fillCnt = 0
    
    for empty in emptys {
        for i in 0..<blocks.count {    
            guard !isUsed[i] else { continue }
            
            let cntIfMatched = matchBlocks(blocks[i], target: empty)
            
            if cntIfMatched > 0 {
                isUsed[i] = true
                fillCnt += cntIfMatched
                break
            }
        }
    }
    
    return fillCnt
}

func printBlock(_ block: [[Int]]) {
    for r in block {
        print(r)
    }
}

func countBlock(_ block: [[Int]]) -> Int {
    var cnt = 0
    
    for row in block {
        cnt += row.reduce(0) { $0 + $1 }
    }
    
    return cnt
}

func matchBlocks(_ block: [[Int]], target: [[Int]]) -> Int {
    
    var block = block
    
    for i in 0..<4 {
        
        if block == target {
            return countBlock(block)
        }
        
        if i == 3 { 
            return 0 
        }
        
        block = rotate(block)
    }
    
    return 0
}

// table에서 block을 찾아 6*6 크기의 블럭 배열로 리턴 -> [block, block]
func findBlocks(_ table: [[Int]], for value: Int) -> [[[Int]]] {
    
    let N = table.count
    let dx = [0,0,-1,1]
    let dy = [-1,1,0,0]
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
    var blocks: [[[Int]]] = []
    
    func bfs(x: Int, y: Int) -> [[Int]] {
        
        var coor: [(x: Int, y: Int)] = []
        var queue: [(x: Int, y: Int)] = []
    
        queue.append((x: x, y: y))
        coor.append((x: x, y: y))
        visited[x][y] = true
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()

            for k in 0..<4 {
                let x = cur.x + dx[k]
                let y = cur.y + dy[k]

                guard 0..<N ~= x && 0..<N ~= y else { continue }
                guard !visited[x][y] else { continue }
                guard table[x][y] == value else { continue }
                
                queue.append((x: x, y: y))
                coor.append((x: x, y: y))
                visited[x][y] = true
            }
        }
        
        let minX = coor.map { $0.x }.min()!
        let minY = coor.map { $0.y }.min()!
        
        let maxX = coor.map { $0.x }.max()!
        let maxY = coor.map { $0.y }.max()!
        
        var block = Array(repeating: Array(repeating: 0, count: maxY-minY+1), count: maxX-minX+1)
        
        for (x, y) in coor {
            block[x-minX][y-minY] = 1
        }
        
        return block
    }
    
    for i in 0..<N {
        for j in 0..<N {
            guard !visited[i][j] else { continue }
            guard table[i][j] == value else { continue }
            
            blocks.append(bfs(x: i, y: j))
        }
    }
    
    return blocks
}

// 시계방향으로 회전
func rotate(_ block: [[Int]]) -> [[Int]] {
    
    let N = block.count          // 행(row)
    let M = block.first!.count   // 열(column)
    
    var rotated = Array(repeating: Array(repeating: 0, count: N), count: M)
    
    for i in 0..<N {
        for j in 0..<M {
            rotated[j][N-1-i] = block[i][j]
        }
    }
    return rotated
}