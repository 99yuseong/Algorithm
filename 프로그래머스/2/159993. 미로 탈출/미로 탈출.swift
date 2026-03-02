import Foundation

// 직사각형 격자의 미로 탈출
// 레버를 당겨서 탈출 가능

// 1. 레버 칸으로 이동해서 레버 당김
// 2. 탈출 칸으로 이동

// 레버 당기지 않아도 탈출칸 가능

// 걸리는 최소시간? 불가능 시 -1

// 칸수: 25~1만칸

// 1. X가 아닌 칸으로 L에 도달하면 끝
// 2. X가 아닌 칸으로 E에 도달하면 끝

// BFS 2번 - visited는 걸린 시간으로 채우기 > t_l + t_e로 연산

// 1. map 가공 > O(n)
// 2. BFS 2번 > O(2*4*n)

struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { return inbox.isEmpty && outbox.isEmpty }
    mutating func append(_ k: T) { inbox.append(k) }
    mutating func removeFirst() -> T? { 
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func solution(_ maps:[String]) -> Int {
    
    let n = maps.count
    let m = maps[0].count
    
    // 1. map 가공
    var map = maps.map { Array($0).map { String($0) } }
    
    func BFS(_ start: [Int], _ target: [Int]) -> Int {
        
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        var visited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
        var queue = Queue<[Int]>()
        queue.append(start)
        visited[start[0]][start[1]] = 0
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()!
            
            if cur == target {
                return visited[cur[0]][cur[1]]
            }
            
            for i in 0..<4 {
                let x = cur[0] + dx[i]
                let y = cur[1] + dy[i]
                
                if 0..<n ~= x && 0..<m ~= y
                && map[x][y] != "X"
                && visited[x][y] == -1 {
                    queue.append([x, y])
                    visited[x][y] = visited[cur[0]][cur[1]] + 1
                }
            }
        }
        
        return -1
    }
    
    var s: [Int] = []
    var l: [Int] = []
    var e: [Int] = []
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == "S" { 
                s = [i,j] 
            } else if map[i][j] == "E" { 
                e = [i,j] 
            } else if map[i][j] == "L" { 
                l = [i,j] 
            }
        }
    }
    
    let t_l = BFS(s, l)
    let t_e = BFS(l, e)
    
    return (t_l == -1 || t_e == -1) ? -1 : t_l + t_e
}

