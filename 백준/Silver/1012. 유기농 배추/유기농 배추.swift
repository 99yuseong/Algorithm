let T = Int(readLine()!)! // 테스트 케이스

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let mx = input[0] // 가로
    let my = input[1] // 세로
    let mk = input[2] // 배추 갯수
    var map = Array(repeating: Array(repeating: 0, count: my), count: mx)
    
    for _ in 0..<mk {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        map[input[0]][input[1]] = 1
    }
    
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    var answer = 0
    
    for i in 0..<mx {
        for j in 0..<my {
            if map[i][j] == 1 {
                var queue: [[Int]] = []
                queue.append([i,j])
                
                while !queue.isEmpty {
                    let cur = queue.removeFirst()
                    
                    for i in 0..<4 {
                        let x = cur[0] + dx[i]
                        let y = cur[1] + dy[i]
                        
                        if (0..<mx) ~= x && (0..<my) ~= y && map[x][y] == 1 {
                            queue.append([x,y])
                            map[x][y] = 0
                        }
                    }
                }
                answer += 1
            }
        }
    }
    
    print(answer)
}