func solution(N: Int) -> Int {
    
    // N장의 카드
    // 1~N까지의 번호
    // 1번이 위 ~ N번이 아래
    
    // 1. 맨위를 버린다.
    // 2. 맨위를 맨 아래로.
    
    // 1234
    // 1. 1버림
    // 2. 342
    // 3. 3버림
    // 4. 24
    // 5. 2버림
    // 6. 4
    // 마지막 남는 카드
    
    // N: 1~50만 -> O(N)
    
    struct Deque {
        var inbox: [Int] = []
        var outbox: [Int] = []
        var count: Int { inbox.count + outbox.count }
        var top: Int? { outbox.isEmpty ? inbox.first : outbox.last }
        mutating func pop() -> Int? {
            if outbox.isEmpty {
                outbox = inbox.reversed()
                inbox.removeAll()
            }
            return outbox.popLast()
        }
        mutating func push(_ x: Int) {
            inbox.append(x)
        }
    }
    
    var DQ = Deque()
    for i in 1...N {
        DQ.push(i)
    }
    
    while DQ.count > 1 {
        DQ.pop()
        DQ.push(DQ.pop()!)
    }
    
    return DQ.top!
}

let N = Int(readLine()!)!
print(solution(N: N))
