let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var map: [[Int]] = []
var empty: [[Int]] = []
var virus: [[Int]] = []
let dx = [0, 1, -1, 0]
let dy = [1, 0, 0, -1]

struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    
    var isEmpty: Bool { inbox.isEmpty && outbox.isEmpty }
    mutating func append(_ item: T) {
        inbox.append(item)
    }
    
    mutating func removeFirst() -> T {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.removeLast()
    }
}

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 0 { empty.append([i,j]) }
        else if map[i][j] == 2 { virus.append([i,j]) }
    }
}

var selection: [Int] = []
var safe = 0

for i in 0..<empty.count {
    selection.append(i)
    for j in i..<empty.count {
        selection.append(j)
        for k in j..<empty.count {
            selection.append(k)
            safe = max(safe, bfs())
            selection.removeLast()
        }
        selection.removeLast()
    }
    selection.removeLast()
}

//func select(_ k: Int, _ start: Int) {
//    if k == 3 {
//        // 벽 칠하고 BFS
//        safe = max(safe, bfs())
//        return
//    }
//    
//    for i in start..<empty.count {
//        selection.append(i)
//        select(k+1, start+1)
//        selection.removeLast()
//    }
//}
//select(0, 0)
print(safe)

func bfs() -> Int {
    var newMap = map
    var cnt = 0
    
    // 벽 세우기
    for select in selection {
        let cur = empty[select]
        newMap[cur[0]][cur[1]] = 1
    }
    
    // 바이러스 전파
    var queue = Queue<[Int]>()
    for v in virus {
        queue.append(v)
    }
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if 0..<N ~= x && 0..<M ~= y && newMap[x][y] == 0 {
                newMap[x][y] = 2
                queue.append([x,y])
                cnt += 1
            }
        }
    }
    
    return empty.count - cnt - 3
}
