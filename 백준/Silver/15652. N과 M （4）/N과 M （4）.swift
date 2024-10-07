let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var arr = Array(repeating: 0, count: M)

func solution(_ k: Int) {
    if k == M {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 0..<N {
        if (k == 0 || arr[k-1] <= i+1) {
            arr[k] = i+1
            solution(k+1)
        }
    }
}

solution(0)
