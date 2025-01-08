// 12초
// 1024MB

// 정수로 이루어진 배열 ABCD
// A[a] + B[b] + C[c] + D[d] = 0인 쌍의 개수

// 배열의 크기는 N: 1~4000
// 4개의 합은2^31-1을 넘지 않는다.

let N = Int(readLine()!)!

var A: [Int] = [] // 4000 * 8 -> 32000 * 4 -> 128000
var B: [Int] = []
var C: [Int] = []
var D: [Int] = []

for _ in 0..<N {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    A.append(arr[0])
    B.append(arr[1])
    C.append(arr[2])
    D.append(arr[3])
}

var T: [Int] = []
var W: [Int] = []

for i in 0..<N { // O(N^2)
    for j in 0..<N {
        T.append(A[i]+B[j])
        W.append(C[i]+D[j])
    }
}

T.sort()
W.sort()

var count = 0
for i in 0..<T.count { // O(N^2*lgN)
    let lb = lowerBound(-T[i])
    let ub = upperBound(-T[i])
    
    if 0..<W.count ~= lb && W[lb] + T[i] == 0 { count += ub - lb }
}
print(count)

// W에서 x 찾기 -> O(lgN^2) = O(lgN)
func lowerBound(_ x: Int) -> Int {
    var min = 0
    var max = W.count
    
    while min < max {
        let mid = (min + max) / 2
        
        if W[mid] < x { min = mid + 1 }
        else { max = mid }
    }
    return min
}

func upperBound(_ x: Int) -> Int {
    var min = 0
    var max = W.count
    
    while min < max {
        let mid = (min + max) / 2
        
        if W[mid] <= x { min = mid + 1 }
        else { max = mid }
    }
    return min
}
