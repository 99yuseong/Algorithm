import Foundation

// S - 직진
// L - 좌회전
// R - 우회전

// 넘어가면 반대끝으로 다시 돌아옴

// 빛이 이동하는 경로 사이클
// 각 사이클의 길이

// 모든 사이클의 길이를 배열에 담아 오름차순 정렬

// 점이 기준이 아님
// [a, b]이게 기준인데.

// 점: 1~2.5만
// in, out -> 8가지 길
// 2.5 * 4 = 10만 가지 경우의 수

// visited[i][j][dir]

// 전체를 돌면서 - bfs로 이동한 점을 큐로 넣고, cnt ++

func solution(_ grid:[String]) -> [Int] {
    
    var cycles: [Int] = []
    
    let n = grid.count
    let m = grid.first!.count
    
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 4), count: m), count: n)
    var map = grid.map { Array($0) }
    
    
    // dir
    // S
    
    //    0
    //  3   1
    //    2
    
    enum Direction: Int {
        case up = 0
        case right = 1
        case down = 2
        case left = 3
        
        var L: Int {
            switch self {
            case .up: return Direction.left.rawValue
            case .right: return Direction.up.rawValue
            case .down: return Direction.right.rawValue
            case .left: return Direction.down.rawValue
            }
        }
        
        var R: Int {
            switch self {
            case .up: return Direction.right.rawValue
            case .right: return Direction.down.rawValue
            case .down: return Direction.left.rawValue
            case .left: return Direction.up.rawValue
            }
        }
    }
    
    func move(_ x: Int, _ y: Int, _ dir: Int, _ sec: Character) -> (Int, Int, Int) {
        switch sec {
            case "S":
                let D = Direction(rawValue: dir)!
                switch D {
                    
                case .up:
                    return (x-1 < 0 ? n-1 : x-1, y, dir)
                case .right:
                    return (x, y+1 > m-1 ? 0 : y+1, dir)
                case .down:
                    return (x+1 > n-1 ? 0 : x+1, y, dir)
                default:
                    return (x, y-1 < 0 ? m-1 : y-1, dir)
                }
            
            case "L":
            
                let D = Direction(rawValue: dir)!
            
                switch D {
                case .up:
                    return (x, y-1 < 0 ? m-1 : y-1, D.L)
                case .right:
                    return (x-1 < 0 ? n-1 : x-1, y, D.L)
                case .down:
                    return (x, y+1 > m-1 ? 0 : y+1, D.L)
                default:
                    return (x+1 > n-1 ? 0 : x+1, y, D.L)
                }
            
            default: // "R"
            
                let D = Direction(rawValue: dir)!
            
                switch D {
                case .up:
                    return (x, y+1 > m-1 ? 0 : y+1, D.R)
                case .right:
                    return (x+1 > n-1 ? 0 : x+1, y, D.R)
                case .down:
                    return (x, y-1 < 0 ? m-1 : y-1, D.R)
                case .left:
                    return (x-1 < 0 ? n-1 : x-1, y, D.R)
                }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            for dir in 0..<4 {
                if !visited[i][j][dir] {
                    
                    var x = i
                    var y = j
                    var d = dir
                    var cycle = 0
                    
                    // 사이클 돌 때까지 계속 이동
                    while !visited[x][y][d] {
                        visited[x][y][d] = true
                        cycle += 1
                        
                        // 다음 위치로 이동
                        (x, y, d) = move(x, y, d, map[x][y])
                    }
                    
                    if cycle > 0 {
                        cycles.append(cycle)
                    }
                }
            }
        }
    }
    
    
    return cycles.sorted()
}