import Foundation

func solution(_ places:[[String]]) -> [Int] {
    
    var ans: [Int] = []
    for place in places {
        let place = place.map { Array($0).map { String($0) } }
        ans.append(checkPlace(place))
    }
    
    return ans
}

func checkPlace(_ place: [[String]]) -> Int {
    for i in 0..<5 {
        for j in 0..<5 {
            if place[i][j] == "P" {
                if BFS(i,j, place) == 0 { return 0 }
            }
        }
    }
    
    return 1
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

struct Queue<T> {
    var inbox: [T] = []
    var outbox: [T] = []
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

func BFS(_ i: Int, _ j: Int, _ place: [[String]]) -> Int {
    
    var queue = Queue<[Int]>()
    queue.append([i,j])
    var visited = Array(repeating: Array(repeating: -1, count: 5), count: 5)
    visited[i][j] = 0
                
    while !queue.isEmpty {
        let cur = queue.removeFirst()!
                    
        for k in 0..<4 {
            let x = cur[0] + dx[k]
            let y = cur[1] + dy[k]
                        
            if 0..<5 ~= x && 0..<5 ~= y 
            && visited[x][y] == -1 
            && place[x][y] != "X" { // "빈공간 or P"
                            
                let dist = visited[cur[0]][cur[1]] + 1
                
                if place[x][y] == "P" && dist <= 2 { // 거리 2안에 P가 있으면
                    return 0  // 리턴 0
                } else if dist <= 2 { // 거리 2까지만 탐색
                    queue.append([x,y])
                    visited[x][y] = dist   
                }
            }
        }    
    }
    
    return 1
}

// 대기실 5개, 5*5 크기
// 거리 맨해튼 거리, abs(x1-x2) + abs(y1-y2) > 2
// 파티션으로 막혀있을 때는 가능

// 응시자가 앉은 자리 P
// 빈테이블 0
// 파티션 X