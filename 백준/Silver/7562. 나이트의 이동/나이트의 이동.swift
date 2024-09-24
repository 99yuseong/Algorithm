struct Q<T: Equatable> {
    var inbox: [T] = []
    var outbox: [T] = []
    var isEmpty: Bool { inbox.isEmpty && outbox.isEmpty }
    mutating func enqueue(_ value: T) { inbox.append(value) }
    mutating func dequeue()-> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

let N = Int(readLine()!)!

out: for _ in 0..<N {
    let I = Int(readLine()!)!
    let fromPos = readLine()!.split(separator: " ").map { Int($0)! }
    let toPos = readLine()!.split(separator: " ").map { Int($0)! }
    
    let move = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1], [-1,2]]
    var arr = Array(repeating: Array(repeating: 0, count: I), count: I)
    var queue = Q<[Int]>()
    
    queue.enqueue(fromPos)
    arr[fromPos[0]][fromPos[1]] = 1
    
    while !queue.isEmpty {
        let cur = queue.dequeue()!
        
        if toPos == [cur[0],cur[1]] {
            print(arr[cur[0]][cur[1]]-1)
            continue out
        }
        
        for i in 0..<8 {
            let x = cur[0] + move[i][0]
            let y = cur[1] + move[i][1]
            
            if 0..<I ~= x && 0..<I ~= y && arr[x][y] == 0 {
                queue.enqueue([x,y])
                arr[x][y] = arr[cur[0]][cur[1]] + 1
            }
        }
    }
}
