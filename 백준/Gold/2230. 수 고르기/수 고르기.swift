// 2초
// 128MB

// N개의 정수 수열 A (무작위 숫자들)
// 차이가 M이상이면서 제일 작은 경우

// 1. A 정렬
// 2. for 문으로 N개의 수를 돌면서
// 2-1. 이분탐색 (x + M) 기준으로 탐색 lowerBound

// M이 주어지니까

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0] // 1~10만 -> O(NlgN)
let M = NM[1] // 0~20억
var A: [Int] = []
for _ in 0..<N { A.append(Int(readLine()!)!) }
A.sort() // O(NlgN)

// A[mid]
// 1 3 5
var ans = Int.max
for i in 0..<N {
    let lb = lowerBound(start: i, x: A[i])
    
    if 0..<N ~= lb {
        ans = min(A[lb]-A[i], ans)
    }
}
print(ans == Int.max ? M : ans)

// A[mid]는 항상 x보다 크다
func lowerBound(start: Int, x: Int) -> Int {
    var st = start
    var en = N
    
    while st < en {
        let mid = (st + en) / 2
        
        if A[mid] - x < M { st = mid + 1 }
        else { en = mid }
    }
    
    return st
}

// TestCase
// 1 0
// 1

