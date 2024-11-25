// 정부 X에 사용할 수 있는 연산

// X가 3으로 나누어 떨어지면, 3으로 나눈다.
// X가 2로 나누어 떨어지면, 2로 나눈다.
// 1을 뺀다.

// 연산 3개를 사용해서 1
// N -> 1로 만드는 연산의 최솟값
// 1 <= N <= 10^6 (백만)

let N = Int(readLine()!)!
var queue: [[Int]] = []
var visited = Array(repeating: false, count: N)

queue.append([N, 0])
while !queue.isEmpty {
    let cur = queue.removeFirst()
    
    if cur[0] == 1 {
        print(cur[1])
        break
    }
    
    if !visited[cur[0]/3] && cur[0] % 3 == 0 {
        queue.append([cur[0]/3, cur[1]+1])
        visited[cur[0]/3] = true
    }
    
    if !visited[cur[0]/2] && cur[0] % 2 == 0 {
        queue.append([cur[0]/2, cur[1]+1])
        visited[cur[0]/2] = true
    }
    
    if !visited[cur[0]-1] {
        queue.append([cur[0]-1, cur[1]+1])
        visited[cur[0]-1] = true
    }
}
