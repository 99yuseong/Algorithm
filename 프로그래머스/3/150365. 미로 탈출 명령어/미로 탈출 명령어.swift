import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {

    // 0-based
    var cx = x - 1
    var cy = y - 1
    let tx = r - 1
    let ty = c - 1

    func dist(_ ax: Int, _ ay: Int, _ bx: Int, _ by: Int) -> Int {
        abs(ax - bx) + abs(ay - by)
    }

    let startDist = dist(cx, cy, tx, ty)
    if startDist > k { return "impossible" }
    if (k - startDist) % 2 != 0 { return "impossible" }

    let dx = [1, 0, 0, -1]
    let dy = [0, -1, 1, 0]
    let dr: [Character] = ["d", "l", "r", "u"]

    var route: [Character] = []
    route.reserveCapacity(k)

    for step in 0..<k {
        
        let rem = k - step - 1  // 이번 이동 후 남은 횟수
        var moved = false

        for i in 0..<4 { // d l r u 순서대로 시도
            let nx = cx + dx[i]
            let ny = cy + dy[i]

            if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }

            let d = dist(nx, ny, tx, ty)
            if d > rem { continue }
            if (rem - d) % 2 != 0 { continue }

            // 확정
            cx = nx
            cy = ny
            route.append(dr[i])
            moved = true
            break
        }

        if !moved { return "impossible" }
    }

    return (cx == tx && cy == ty) ? String(route) : "impossible"
}