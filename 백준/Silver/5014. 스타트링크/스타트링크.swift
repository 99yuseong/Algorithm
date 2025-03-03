// F층
// 스타트링크 - G층
// 강호 - 현재 S층
// S -> G로 이동

// U, D중 하나로 이동가능
// G층에 도착하려번 버튼을 몇번?
// 갈 수 없다면 use the stairs

// S: 1~1000만
// G: 1~1000만
// F: 1~1000만
// U: 0~1000만 위로
// D: 0~1000만 아래로

func solution(_ F: Int, _ S: Int, _ G: Int, _ U: Int, _ D: Int) -> String {
    // BFS로 구현
    // U 조건 - 방문 & 상한
    // D 조건 - 방문 & 하한
    // 이동이 불가능하다? use the stairs
    var queue: [Int] = []
    var visited = Array(repeating: -1, count: F+1)
    
    queue.append(S)
    visited[S] = 0
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        if cur == G {
            return "\(visited[cur])"
        }
        
        let up = cur + U
        let down = cur - D
        
        for move in [up, down] {
            if 1...F ~= move && visited[move] == -1 {
                queue.append(move)
                visited[move] = visited[cur] + 1
            }
        }
    }
    
    return "use the stairs"
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
print(solution(input[0], input[1], input[2], input[3], input[4]))
