let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // >= M
let M = input[1]

var arr = Array(repeating: 0, count: 10)
var isUsed = Array(repeating: false, count: 10)

func sol(_ k: Int) {
    if k == M {
        print(arr[0..<M].map { String($0) }.joined(separator: " "))
    }
    
    for i in 1...N {
        if !isUsed[i] {
            arr[k] = i
            isUsed[i] = true
            sol(k+1)
            isUsed[i] = false
        }
    }
}

sol(0)
