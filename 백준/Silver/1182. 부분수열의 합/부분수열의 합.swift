let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let S = input[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var count = 0

func solo(_ cur: Int, _ tot: Int) {
    if cur == N {
        if tot == S { count += 1 }
        return
    }
    
    solo(cur+1, tot)
    solo(cur+1, tot+arr[cur])
}

solo(0, 0)
if S == 0 {
    count -= 1
}
print(count)
