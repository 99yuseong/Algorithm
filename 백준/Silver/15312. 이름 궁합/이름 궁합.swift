// 1초
let cnts = [3, 2, 1, 2, 3, 3, 2, 3, 3, 2, 2, 1, 2, 2, 1, 2, 2, 2, 1, 2, 1, 1, 1, 2, 2, 1]

let A = Array(readLine()!).map { cnts[Int($0.asciiValue!) - 65] }
let B = Array(readLine()!).map { cnts[Int($0.asciiValue!) - 65] }
let N = A.count
var arr: [Int] = []

for i in 0..<N {
    arr.append(A[i])
    arr.append(B[i])
}

var max = 2*N-1
while max > 1 {
    for i in (0..<max) {
        arr[i] = (arr[i+1] + arr[i]) % 10
    }
    max -= 1
}
print("\(arr[0])\(arr[1])")
