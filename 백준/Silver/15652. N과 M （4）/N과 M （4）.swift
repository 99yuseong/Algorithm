let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var arr = Array(repeating: 0, count: M)

func box(_ k: Int) { // 현재까지 k개의 수를 택함
    if k == M {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    
    var start = 1
    if k != 0 { start = arr[k-1] }
    guard start <= N else { return }
    
    for i in start...N {
        arr[k] = i
        box(k+1)
    }
}
box(0)
