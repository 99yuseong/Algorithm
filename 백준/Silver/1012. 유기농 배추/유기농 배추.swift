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
    
    mutating func removeFirst() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
}

let T = Int(readLine()!)!

for _ in 0..<T {
    let data = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n, k) = (data[0], data[1], data[2])
    
    var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
    var queue = Q<[Int]>()
    var section = 0
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        arr[input[1]][input[0]] = 1
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] == 1 {
                queue.append([i,j])
                arr[i][j] = 0
                section += 1
                
                while !queue.isEmpty {
                    let cur = queue.removeFirst()!
                    
                    for i in 0..<4 {
                        let x = cur[0] + dx[i]
                        let y = cur[1] + dy[i]
                        
                        if 0..<n ~= x && 0..<m ~= y && arr[x][y] == 1 {
                            queue.append([x,y])
                            arr[x][y] = 0
                        }
                    }
                }
            }
        }
    }
    
    print(section)
}
