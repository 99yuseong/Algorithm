let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var ans = Array(repeating: 0, count: M)

func box(_ k: Int) { // 현재까지 k개의 수를 택함
    if k == M {
        print(ans.map { String(arr[$0]) }.joined(separator: " "))
        return
    }
    
    let start = k == 0 ? 0 : ans[k-1]
    
    for i in start..<N {
        ans[k] = i
        box(k+1)
    }
}
box(0)
