import Foundation

struct Queue<T> {
    var inbox = [T]()
    var outbox = [T]()
    
    var isEmpty: Bool { inbox.isEmpty && outbox.isEmpty }
    mutating func append(_ k: T) { inbox.append(k) }
    mutating func removeFirst() -> T? {
        if outbox.isEmpty { 
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var ans = n
    
    for i in 0..<wires.count {
        var Connected: [[Int]] = Array(repeating: [], count: n+1)
        
        for wire in wires {
            guard wire != wires[i] else { continue }
            
            let a = wire[0]
            let b = wire[1]
            
            Connected[a].append(b)
            Connected[b].append(a)
        }
        
        var k = 0
        var queue = Queue<Int>()
        queue.append((i+1) % n + 1)
        var visited: [Bool] = Array(repeating: false, count: n+1)
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()!
            
            for top in Connected[cur] {
                if !visited[top] {
                    visited[top] = true
                    queue.append(top)
                    k += 1
                }
            }
        }
        
        if abs(n - k * 2) < ans { ans = abs(n - k * 2) }
    }
    
    return ans
}

// n: 2~100
// wires: n-1길이의 정수형 이차원 배열

// 하나의 트리 형태

// 송전탑의 개수 n,
// 전선정보 wires
// 전선 하나를 끊어서 송전탑 개수가 비슷하도록 나누었을때, 송전탑의 개수 차이를 리턴

// 1. wires loop 
//    -> i번째를 제외한 탑 배열 선언
//    -> n번째 탑과 연결된 탑 배열 - 이차원 배열 선언

// 2. BFS 돌면서 연결된 탑의 개수 k 계산 -> O(N)
// 3. abs(n - k - k) 최솟값 계산