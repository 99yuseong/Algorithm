// 2초
// 512MB

// M개의 우주, 행성 N개
// 균등한 우주의 쌍은 몇개인가?

// 우주가 M개, 행성 N개

// M: 2~100개의 우주
// N: 3~1만개의 행성
// 행성의 크기: 1~100만

let MN = readLine()!.split(separator: " ").map { Int($0)! }
let M = MN[0] // 우주 수
let N = MN[1] // 행성 수
var A: [[Int]] = [] // [ [우주 1], [우주 2], ... [우주 M] ]

for _ in 0..<M {
    var universe = readLine()!.split(separator: " ").map { Int($0)! }
    let sorted = universe.sorted() // O(NlgN)
    
    for i in 0..<universe.count { // O(N)
        let idx = upperBound(arr: sorted, x: universe[i]) // O(lgN)
        universe[i] = idx
    }
    
    A.append(universe)
}

var count = 0
for i in 0..<M {
    for j in (i+1)..<M {
        if A[i] == A[j] { count += 1 }
    }
}
print(count)

func upperBound(arr: [Int], x: Int) -> Int {
    var min = 0
    var max = arr.count
    
    while min < max {
        let mid = (min + max) / 2
        
        if arr[mid] < x { min = mid + 1 }
        else { max = mid }
    }
    
    return min
}



