let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var arr = Array(repeating: 0, count: M)
var isUsed = Array(repeating: false, count: N)

func sol(_ k: Int) {
    if k == M {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 0..<N {
        if !isUsed[i] {
            arr[k] = i+1
            isUsed[i] = true
            sol(k+1)
            isUsed[i] = false
        }
    }
}

sol(0)
