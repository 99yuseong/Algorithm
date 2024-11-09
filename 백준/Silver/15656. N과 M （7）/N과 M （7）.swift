let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var ans = Array(repeating: "", count: M)
var result = ""

func box(_ k: Int) { // 현재까지 k개의 수를 택함
    if k == M {
        result += ans.joined(separator: " ") + "\n"
        return
    }
    
    for num in arr {
        ans[k] = String(num)
        box(k+1)
    }
}
box(0)
print(result)
