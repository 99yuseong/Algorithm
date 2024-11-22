// N명 모임
// N은 짝수
// N/2 N/2로 두팀으로 나뉘어야 함

// 1번부터 N까지

// ㄴ,ㅇ략ㅊ; 저시
// i와 j가 같은 팀일때 능력치
// Sij와 Sji는 다를 수 있다.
// Sij + Sji

// 4 <= N <= 20
// 1 <= S <= 100

// 총 N * N개의 케이스 20C10 = 180400, 10 * 9 = 90 -> 16,000,000
let N = Int(readLine()!)!
var score: [[Int]] = []
for _ in 0..<N {
    score.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var tot = 0
var selected = Array(repeating: false, count: N)

var diff = 10000

for i in 0..<N {
    for j in 0..<N {
        tot += score[i][j]
    }
}

func select(_ k: Int, start: Int) {
    if k == N/2 {
        var sum1 = 0
        var sum2 = 0
        
        for i in 0..<N {
            for j in 0..<N {
                if selected[i] && selected[j] {
                    sum1 += score[i][j]
                } else if !selected[i] && !selected[j] {
                    sum2 += score[i][j]
                }
            }
        }
        
        diff = min(diff, abs(sum1 - sum2))
        
        return
    }
    
    for i in start..<N {
        selected[i] = true
        select(k+1, start: i+1)
        selected[i] = false
    }
}
select(0, start: 0)
print(diff)
