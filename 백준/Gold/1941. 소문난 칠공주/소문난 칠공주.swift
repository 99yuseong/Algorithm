import Foundation

let board = (0..<5).map { _ in Array(readLine()!) }
let idx = (0..<5).flatMap { i in (0..<5).map { j in (i, j) } }
var s = [(Int, Int)]()
var n = [Character]()
var ans = 0

func isAvailable(_ s: [(Int, Int)]) -> Bool {
    var remaining = s
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    var queue = [(remaining[0])]
    remaining.remove(at: 0)

    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if let index = remaining.firstIndex(where: { $0 == (nx, ny) }) {
                queue.append(remaining[index])
                remaining.remove(at: index)
            }
        }
    }
    
    return remaining.isEmpty
}

func dfs(_ depth: Int) {
    if s.count == 7 {
        if n.filter({ $0 == "S" }).count >= 4 && isAvailable(s) {
            ans += 1
        }
        return
    }
    
    for i in depth..<25 {
        let (x, y) = idx[i]
        s.append((x, y))
        n.append(board[x][y])
        dfs(i + 1)
        s.removeLast()
        n.removeLast()
    }
}

dfs(0)
print(ans)
