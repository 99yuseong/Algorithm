import Foundation

let N = Int(readLine()!)!
var tower: [[Int]] = []
var stack: [Int] = []
var result: Int = 0
// 0  1 2 3 4  5
// 10 3 7 4 12 2
for i in 0..<N {
    tower.append([i, Int(readLine()!)!])
}
tower.append([N, Int.max])

// 10 같거나, 큰 수에서 Pop -> stack에 쌓이는 수는 자기보다 무조건 작다
for i in 0...N {
    while !stack.isEmpty && (tower[i][1] >= tower[stack.last!][1]) {
        result += (tower[i][0] - tower[stack.removeLast()][0]) - 1
    }
    stack.append(tower[i][0])
}

print(result)