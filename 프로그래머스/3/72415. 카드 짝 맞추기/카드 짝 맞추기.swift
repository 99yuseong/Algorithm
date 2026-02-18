import Foundation

typealias P = (r:Int, c:Int)
let dr = [-1, 1, 0, 0]
let dc = [0, 0, -1, 1]

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    
    let (pairs, idOf) = buildPairs(board)
    let m = pairs.count
    let full = (1 << m) - 1
    var memo = Array(repeating: Array(repeating: -1, count: 1 << m), count: 16)

    func idx(_ p: P) -> Int { p.r * 4 + p.c }
    func toP(_ i: Int) -> P { (i / 4, i % 4) }

    func dfs(_ pos: Int, _ mask: Int) -> Int {
        if mask == full { return 0 }
        if memo[pos][mask] != -1 { return memo[pos][mask] }

        let cur = toP(pos)
        let distFromCur = bfsDist(board, idOf, mask, cur)

        var best = Int.max / 4

        for k in 0..<m where (mask & (1 << k)) == 0 {
            let a = pairs[k][0], b = pairs[k][1]

            // cur -> a -> b
            let distFromA = bfsDist(board, idOf, mask, a)
            let cost1 = distFromCur[a.r][a.c] + distFromA[b.r][b.c] + 2 + dfs(idx(b), mask | (1 << k))

            // cur -> b -> a
            let distFromB = bfsDist(board, idOf, mask, b)
            let cost2 = distFromCur[b.r][b.c] + distFromB[a.r][a.c] + 2 + dfs(idx(a), mask | (1 << k))

            best = min(best, cost1, cost2)
        }

        memo[pos][mask] = best
        return best
    }

    return dfs(r * 4 + c, 0)
}

func buildPairs(_ board: [[Int]]) -> (pairs: [[P]], idOf: [Int:Int]) {
    var posByValue: [Int:[P]] = [:]
    for r in 0..<4 {
        for c in 0..<4 {
            let v = board[r][c]
            if v == 0 { continue }
            posByValue[v, default: []].append((r,c))
        }
    }
    let values = posByValue.keys.sorted()
    var idOf: [Int:Int] = [:]
    var pairs: [[P]] = []
    for (i, v) in values.enumerated() {
        idOf[v] = i
        pairs.append(posByValue[v]!)   // 항상 2개
    }
    return (pairs, idOf)
}

func isAlive(_ board: [[Int]], _ idOf: [Int:Int], _ mask: Int, _ r: Int, _ c: Int) -> Bool {
    let v = board[r][c]
    if v == 0 { return false }
    let id = idOf[v]!
    return (mask & (1 << id)) == 0
}

func ctrlMove(_ board: [[Int]], _ idOf: [Int:Int], _ mask: Int, _ r: Int, _ c: Int, _ dir: Int) -> P {
    var nr = r, nc = c
    while true {
        let tr = nr + dr[dir], tc = nc + dc[dir]
        if tr < 0 || tr >= 4 || tc < 0 || tc >= 4 { return (nr, nc) }
        nr = tr; nc = tc
        if isAlive(board, idOf, mask, nr, nc) { return (nr, nc) }
    }
}

func bfsDist(_ board: [[Int]], _ idOf: [Int:Int], _ mask: Int, _ start: P) -> [[Int]] {
    let INF = 1_000_000
    var dist = Array(repeating: Array(repeating: INF, count: 4), count: 4)
    var q: [P] = [start]
    var head = 0
    dist[start.r][start.c] = 0

    while head < q.count {
        let (r,c) = q[head]; head += 1
        let d = dist[r][c]

        for dir in 0..<4 {
            // 1칸
            let r1 = r + dr[dir], c1 = c + dc[dir]
            if (0..<4).contains(r1), (0..<4).contains(c1), dist[r1][c1] > d + 1 {
                dist[r1][c1] = d + 1
                q.append((r1,c1))
            }
            // ctrl
            let (r2,c2) = ctrlMove(board, idOf, mask, r, c, dir)
            if dist[r2][c2] > d + 1 {
                dist[r2][c2] = d + 1
                q.append((r2,c2))
            }
        }
    }
    return dist
}