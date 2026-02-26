// 예산 분배
// 정해진 총액 이하 > 가능한 최대의 예산 배정

// 모두 배정 가능 시 > 그대로 배정
// 모두 배정 불가능 시 > 특정한 정수 상한액을 계산 > 그 이상인 경우 상한액 배정

// 485
// 120 110 140 150
// 120 110 127 127 = 484

// N: 3~1만개의 지방부서
// 원하는 값 1~10만
// M: 총예산 N~10억원

// 배열을 줄테니 예산을 짜보라. 최대한 배정된 예산

// 1. arr.sum <= M 일경우엔 M을 리턴 O(N)
// 2. arr.sum > M일 경우엔
    // 상한액을 정해야함. 상한액을 H로 하면
        // arr.sum <= M인 upperbound
        // O(Nlog10억)

func solution(_ arr: [Int], _ M: Int) -> Int {
    
    let MAX_M = 1_000_000_000
    let sum = arr.reduce(0, +)
    
    if sum <= M { 
        return arr.max()! // 예산 중 최댓값

    } else {
        
        var st = 0
        var en = MAX_M
        
        while st < en {
            let mid = (st + en + 1) / 2
            let sum = arr.map { min($0, mid) }.reduce(0, +)
            
            if sum > M { // 상한액을 낮춰야함
                en = mid - 1
            } else {
                st = mid
            }
            // (2 + 3) / 2 > 2
            // (3 + 4) / 2 > 3
        }

        return st // 상한액이 결국 최댓값
    }
}

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = Int(readLine()!)!
print(solution(A, M))