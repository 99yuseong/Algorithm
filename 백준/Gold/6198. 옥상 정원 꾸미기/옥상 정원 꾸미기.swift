import Foundation

let N = Int(readLine()!)!
var tower: [Int] = []
var stack: [Int] = []
var result: Int = 0

for i in 0..<N {
    tower.append(Int(readLine()!)!)
}
// 맨뒤에 제일 큰 빌딩을 두고 거기에서 다 계산이 되도록
tower.append(Int.max)

// 같거나 큰 수에서 Pop -> stack에 쌓이는 수는 자기보다 무조건 작다
for i in 0...N {
    while !stack.isEmpty && tower[i] >= tower[stack.last!] {
        result += i - stack.removeLast() - 1
    }
    stack.append(i)
}

// 최종적으로 Stack에는 가장 큰 Int.max 빌딩만 남는다.
print(result)