// A는 B를 먹는다.
// A는 크기가 작은 먹이만 먹을 수 있다.
// A의 크기가 B보다 큰 쌍이 몇 개인가?
// 1초, 256MB

let T = Int(readLine()!)! // 테스트 케이스 개수
var N: Int = 0
var M: Int = 0
var A: [Int] = []
var B: [Int] = []

func find(idx: Int) -> Int {
    var min = 0
    var max = M-1
    
    while min <= max {
        let mid = (min + max) / 2
        
        if A[idx] <= B[mid] {
            max = mid - 1
        } else { // A[idx] > B[mid]
            min = mid + 1
        }
    }
    
    return min
}

for _ in 0..<T {
    let NM = readLine()!.split(separator: " ").map { Int($0)! }
    N = NM[0] // 1 <= N,M <= 20000
    M = NM[1]
    A = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    B = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    
    var cnt = 0
    for i in 0..<N {
        cnt += find(idx: i)
    }
    print(cnt)
}

