// 2초
// 128MB

// 조합에서 끝자리 0의 개수
// 0 <= m <= n <= 20억

// 수식에 포함된 최종 5의 개수
// nCm = n! / (m! * (n-m)!)
// n / 5 - ( m / 5 + (n - m) / 5 )
// n! 포함된 5의 개수 - m!에 포함된 5의 개수 - (n-m)!에 포함된 5의 개수

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

func countFive(_ num: Int) -> Int {
    var count = 0
    var d = 5
    
    while d <= num {
        count += num / d
        d *= 5
    }
    
    return count
}

func countTwo(_ num: Int) -> Int {
    var count = 0
    var d = 2
    
    while d <= num {
        count += num / d
        d *= 2
    }
    
    return count
}

var countF = countFive(n) - countFive(m) - countFive(n-m)
var countT = countTwo(n) - countTwo(m) - countTwo(n-m)
print(min(countF, countT))

// TestCase
// Input: 25 12, Output: 2
// Input: 2000000000 1 Output: 1
// Input: 5 1   Output: 0

