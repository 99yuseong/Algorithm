// 1 이동할 수 있는 칸
// 0 벽

let input = readLine()!.split(separator: " ").map { Int($0)! }
let mx = input.first!
let my = input.last!
var map: [[Int]] = []

for _ in 0..<mx {
    map.append(readLine()!.map { Int(String($0))! })
}

var queue: [[Int]] = []
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

queue.append([0,0])

while !queue.isEmpty {
    let cur = queue.removeFirst()
    
    for i in 0..<4 {
        let x = cur.first! + dx[i]
        let y = cur.last! + dy[i]
        
        if (0..<mx) ~= x && (0..<my) ~= y && map[x][y] == 1 && (x,y) != (0,0) {
            queue.append([x,y])
            map[x][y] = map[cur.first!][cur.last!] + 1
        }
    }
}

print(map[mx-1][my-1])