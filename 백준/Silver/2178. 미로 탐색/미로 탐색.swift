import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var map: [[Int]] = []

for _ in 0..<n {
    map.append(Array(readLine()!).map { Int(String($0))! })
}

var queue: [[Int]] = [[0,0]]

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

while !queue.isEmpty {
    let cur = queue.removeFirst()
    let move = map[cur[0]][cur[1]]
    
    for i in 0..<4 {
        let x = cur[0] + dx[i]
        let y = cur[1] + dy[i]
        
        if 0..<n ~= x && 0..<m ~= y && map[x][y] == 1 {
            map[x][y] = move + 1
            queue.append([x, y])
        }
    }
}

print(map[n-1][m-1])

