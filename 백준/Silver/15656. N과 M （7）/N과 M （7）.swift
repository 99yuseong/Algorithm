let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var box = Array(repeating: "", count: M)
var isUsed = Array(repeating: 0, count: N)
var result = ""

func solution(_ k: Int) {
    if k == M {
        result += box.joined(separator: " ") + "\n"
        return
    }
    
    for i in 0..<N {
        box[k] = String(arr[i])
        solution(k+1)
    }
}
solution(0)
print(result)
