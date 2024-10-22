let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var box = Array(repeating: 0, count: M)
var isUsed = Array(repeating: false, count: N)

func solution(_ k: Int) {
    if k == M {
        print(box.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in k..<N {
        if !isUsed[i] && (k == 0 || arr[i] > box[k-1]) {
            isUsed[i] = true
            box[k] = arr[i]
            solution(k+1)
            isUsed[i] = false
        }
    }
}
solution(0)
