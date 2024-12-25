// 2초
// 512MB


// K광년 이동시 K-1 K K+1 광년만 다시 이동할 수있다.

// -1 0 1 -> 1관년 이동
// 0 1 2

// K1 = 1
// Kn = Kn-1 -1 || Kn-1 || Kn-1 + 1

// 바로 직전에는 1광년
// 이동 장치 작동 횟수의 최솟값

// T개의 테스트
// 현재 x, 목표 y, 0 <= x < y < 2^31 (Int)

// 0 3
// 1년차 x: 1
// 2년차 x: 2
// 3년차 x:

let T = Int(readLine()!)!

for _ in 0..<T {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let x = xy[0]
    let y = xy[1]
    
    var left = y-x
    var move = 1
    var year = 0
    
    while left > 0 {
        left -= move
        year += 1
        
        let sum = (move+2) * (move+1) / 2
        
        if left > sum {
            move += 1
        } else if left == sum {
            year += move + 1
            break
        } else if left > sum - (move+1) {
            continue
        } else if left == sum - (move+1) {
            year += move
            break
        } else {
            move = max(1, move-1)
        }
    }
    
    print(year)
}
