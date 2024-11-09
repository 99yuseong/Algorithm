let input = readLine()!.split(separator: " ").map { Int($0)! }
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let N = input[0]
let M = input[1]

var ans = Array(repeating: 0, count: M)
var isUsed = Array(repeating: false, count: N)
var check = Set<[Int]>()

func box(_ k: Int) { // 현재까지 k개의 수를 택함
    if k == M {
        if !check.contains(ans) {
            check.insert(ans)
            print(ans.map { String($0) }.joined(separator: " "))
        }
        return
    }
    
    for i in 0..<N {
        if !isUsed[i] {
            isUsed[i] = true
            ans[k] = arr[i]
            box(k+1)
            isUsed[i] = false
        }
    }
}
box(0)
