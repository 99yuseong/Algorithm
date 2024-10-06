let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var arr = Array(repeating: 0, count: M)
var isUsed = Array(repeating: 0, count: N)
var answer = ""

func sol(_ k: Int) {
    if k == M {
        answer += arr.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    
    for i in 0..<N {
        if isUsed[i] <= M {
            arr[k] = i+1
            isUsed[i] += 1
            sol(k+1)
            isUsed[i] -= 1
        }
    }
}

sol(0)
print(answer)
