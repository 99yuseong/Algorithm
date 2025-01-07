// 1초
// 256MB

// 산성 1~10억
// 알칼리성 -10억~-1

// 세가지 용액을 혼합해서 0에 가장 가까운 용액
// A[x] + A[y] + A[z] ~~ 0에 가까운 용액...

// N: 3~5000개의 용액
// 오름차순으로 출력

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }

var result = Array(repeating: 1000000001, count: 3)
A.sort()


for x in 0..<N {
    for y in (x+1)..<N {
        let lb = lowerBound(st: y+1, x: -A[x]-A[y])
        
        for i in -1...1 {
            let idx = lb + i
            
            guard 0..<N ~= idx else { continue }
            guard x != idx && y != idx else { continue }
            
            if abs(result[0] + result[1] + result[2]) > abs(A[x] + A[y] + A[idx]) {
                result[0] = A[x]
                result[1] = A[y]
                result[2] = A[idx]
            }
        }
    }
}
result.sort()
print(result.map { String($0) }.joined(separator: " "))

func lowerBound(st: Int, x: Int) -> Int {
    var min = 0
    var max = N
    
    while min < max {
        let mid = (min + max) / 2
        
        if A[mid] < x { min = mid + 1 }
        else { max = mid }
    }
    
    return min
}
