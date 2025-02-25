// 토마토가 모두 익게 되는 최소 일수
// M: 가로 2~100
// N: 세로 2~100
// H: 높이 1~100
// 1 익은 토마토, 0 익지 않은 토마토, -1 없는 칸
func solution(_ M: Int, _ N: Int, _ H: Int, _ arr: [[[Int]]]) -> Int {
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
    
    // o(100만)
    let dx = [0,0,-1,1,0,0]
    let dy = [-1,1,0,0,0,0]
    let dz = [0,0,0,0,-1,1]
    
    var visited = arr
    var queue = Queue<[Int]>()
    var t = 0
    
    for k in 0..<H {
        for i in 0..<N {
            for j in 0..<M {
                if visited[k][i][j] > 0 {
                    queue.append([k,i,j])
                }
            }
        }
    }
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()!
        
        for i in 0..<6 {
            let z = cur[0] + dz[i]
            let x = cur[1] + dx[i]
            let y = cur[2] + dy[i]
            
            if 0..<H ~= z && 0..<N ~= x && 0..<M ~= y && visited[z][x][y] == 0 {
                queue.append([z,x,y])
                visited[z][x][y] = visited[cur[0]][cur[1]][cur[2]] + 1
                t = max(t, visited[cur[0]][cur[1]][cur[2]])
            }
        }
    }
    
    for k in 0..<H {
        for i in 0..<N {
            for j in 0..<M {
                if visited[k][i][j] == 0 {
                    return -1
                }
            }
        }
    }
    
    return t
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let M = input[0]
let N = input[1]
let H = input[2]
var arr: [[[Int]]] = []
for _ in 0..<H {
    var floor: [[Int]] = []
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        floor.append(input)
    }
    arr.append(floor)
}
print(solution(M,N,H,arr))
