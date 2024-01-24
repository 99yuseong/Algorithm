import Foundation

struct Q<T> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    mutating func append(_ x: T) {
        inbox.append(x)
    }
    
    mutating func popFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
}

let T = Int(readLine()!)!

out: for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let m = input[0]
    let n = input[1]
    
    var arr: [[Character]] = []
    var map = Array(repeating: Array(repeating: -1, count: m), count: n)
    var sPos: [Int] = []
    var queue = Q<[Int]>()
    
    for i in 0..<n {
        var input = Array(readLine()!)
        
        for j in 0..<m {
            switch input[j] {
            case "*":
                queue.append([i,j])
                map[i][j] = 0
            case "@":
                sPos = [i,j]
                input[j] = "."
                map[i][j] = 0
            case ".":
                map[i][j] = 0
            default:
                break
            }
        }
        
        arr.append(input)
    }

    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]

    while !queue.isEmpty {
        let cur = queue.popFirst()!
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if 0..<n ~= x && 0..<m ~= y && arr[x][y] == "." && map[x][y] == 0 {
                queue.append([x, y])
                map[x][y] = map[cur[0]][cur[1]] + 1
            }
        }
    }

    queue.append([sPos[0], sPos[1], 0])
    arr[sPos[0]][sPos[1]] = " "

    while !queue.isEmpty {
        let cur = queue.popFirst()!
        let time = cur[2]
        
        if cur[0] == 0 || cur[0] == n-1 || cur[1] == 0 || cur[1] == m-1 {
            print(time + 1)
            continue out
        }
        
        for i in 0..<4 {
            let x = cur[0] + dx[i]
            let y = cur[1] + dy[i]
            
            if 0..<n ~= x && 0..<m ~= y && arr[x][y] == "." && (map[x][y] == 0 || time < map[x][y] - 1) {
                queue.append([x, y, time + 1])
                arr[x][y] = " "
            }
        }
    }

    print("IMPOSSIBLE")
}
