// 1은 집이 있는 곳
// 0은 집이 없는 곳
// 단지 수
// 집의수 오름차순
func solution(_ N: Int, _ map: [[Int]]) -> (Int, [Int]) {
    var visited = map
    var queue: [[Int]] = []
    var count = 0
    var numArr: [Int] = []
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    for i in 0..<N {
        for j in 0..<N {
            if visited[i][j] == 1 {
                var num = 1
                queue.append([i,j])
                visited[i][j] = 0
                
                while !queue.isEmpty {
                    let cur = queue.removeFirst()
                    
                    for i in 0..<4 {
                        let x = cur[0] + dx[i]
                        let y = cur[1] + dy[i]
                        
                        if 0..<N ~= x && 0..<N ~= y && visited[x][y] == 1 {
                            queue.append([x,y])
                            visited[x][y] = 0
                            num += 1
                        }
                    }
                }
                
                count += 1
                numArr.append(num)
            }
        }
    }
    
    return (count, numArr.sorted())
}
let N = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<N {
    map.append(Array(readLine()!).map { Int(String($0))! })
}
let (num, sortedArr) = solution(N,map)
print("\(num)\n" + sortedArr.map { String($0) }.joined(separator: "\n"))