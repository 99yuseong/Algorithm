// 수빈 - N: 0~10만 사이에 위치
// 동생 - K: 0~10만 사이에 위치
// 수빈 - 걷거나 순간이동 x-1, x+1, x*2로 이동
// 수빈과 동생 위치
// 가장 빨리 동생을 찾을 수 있는 시간은 몇 초뒤?
// 어떻게 이동하는가?

func solution(_ N: Int, _ K: Int) -> (Int, [Int]) {
    // N이 3가지 종류로 이동
    // 가장 먼저 K에 도달하는 카운트
    // BFS로 0~10만 사이를 이동 - O(N)
    // 근데, 10만 * 2해서 20만으로 이동할 수도.
    // 근데 20만을 초과하지 않는 게 당연히 빠르다.
    
    struct Queue<T> {
        var inbox: [T] = []
        var outbox: [T] = []
        var isEmpty: Bool { inbox.isEmpty && outbox.isEmpty }
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
    
    
    let min = 0
    let max = 100000
    var visited: [Int] = Array(repeating: -1, count: 100001)
    var from: [Int] = Array(repeating: -1, count: 100001)
    var queue = Queue<(Int, Int)>()
    var answer: (Int, [Int]) = (0, [])
    queue.append((0, N))
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()!
        
        if cur.1 == K {
            var path: [Int] = []
            var step = K
            while path.count < cur.0 {
                path.append(from[step])
                step = from[step]
            }
            answer = (cur.0, path.reversed() + [K])
            break
        }
        
        let move1 = cur.1+1
        let move2 = cur.1-1
        let move3 = cur.1*2
        
        for move in [move1, move2, move3] {
            if min...max ~= move && visited[move] == -1 {
                queue.append((cur.0+1, move))
                visited[move] = cur.0+1
                from[move] = cur.1
            }
        }
    }
    
    return answer
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let sol = solution(input[0], input[1])
print(sol.0)
print(sol.1.map { String($0) }.joined(separator: " "))
