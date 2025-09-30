import Foundation

// 두개의 큐
// A (pop) -> B (insert)
// 원소의 합이 같도록
// 최소 작업 횟수 / pop + insert = 1회

// 각 큐의 합을 절반으로

// 3, 2, 7, 2
// 4, 6, 5, 1

// 이건 완전탐색 
// 1에서 뺄지 2에서 뺄지 -> 2^N 만큼 시행
// BFS

// N: 1~30만 * 2개 - O(N)
// 크기: 1000_000_000 * 30만

// 2^30

// 1. 일단 최초 총합 연산 - O(N) / swift는 연산 가능
// 2. index 기준으로 사용
// 3. 백트래킹으로 -> 2^30 - 10억
// 3. BFS로 -> 2^30 도중에 Stop

import Foundation

func solution(_ queue1: [Int], _ queue2: [Int]) -> Int {
    let n = queue1.count
    let arr = queue1 + queue2
    let total = arr.reduce(0, +)
    
    // 전체 합이 홀수면 불가능
    if total % 2 != 0 { return -1 }
    
    let target = total / 2
    var sum1 = queue1.reduce(0, +)
    
    var i1 = 0       // queue1의 front 인덱스
    var i2 = n       // queue2의 front 인덱스
    var count = 0
    
    let limit = n * 3
    
    while count <= limit && i1 < 2 * n && i2 < 2 * n {
        
        if sum1 == target {
            return count
            
        } else if sum1 > target {   // queue1 -> queue2
            sum1 -= arr[i1]
            i1 += 1
        } else {                   // queue2 -> queue1
            sum1 += arr[i2]
            i2 += 1
        }
        count += 1
    }
    
    return -1
}

// func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
//     var q1 = queue1 + queue2
//     var q2 = queue2 + queue1
    
//     var sum1 = queue1.reduce(0, +)
//     var sum2 = queue2.reduce(0, +)
    
//     // 합이 홀수라면 불가능
//     if (sum1 + sum2) % 2 == 1 { return -1 }
    
//     var i1 = 0
//     var i2 = 0
//     var e1 = queue1.count
//     var e2 = queue2.count
    
//     var minTry = Int.max
    
//     func dfs(_ k: Int) {
        
//         print(k, sum1, sum2)
        
//         if sum1 == sum2 {
//             minTry = min(minTry, k)
//             return
//         }
        
//         // if k == q1.count { return }
        
//         // q1 -> q2
//         if i1 < e1-1 && e2 < q2.count {
//             let val = q1[i1]
//             sum1 -= val
//             sum2 += val
//             i1 += 1
//             e2 += 1
//             dfs(k+1)
//             e2 -= 1
//             i1 -= 1
//             sum2 -= val
//             sum1 += val
//         }
        
//         // q2 -> q1
//         if i2 < e2-1 && e1 < q1.count {
//             let val = q2[i2]
//             sum2 -= val
//             sum1 += val
//             i2 += 1
//             e1 += 1
//             dfs(k+1)
//             e1 -= 1
//             i2 -= 1
//             sum1 -= val
//             sum2 += val
//         }
        
//     }
    
//     dfs(0)
    
//     return minTry == Int.max ? -1 : minTry
// }

// func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
//     var q1 = queue1
//     var q2 = queue2
    
//     var sum1 = q1.reduce(0, +)
//     var sum2 = q2.reduce(0, +)
    
//     // 합이 홀수라면 불가능
//     let sum = sum1 + sum2
//     if sum % 2 == 1 { return -1 }
    
//     let maxTry = q1.count + q2.count
//     var minTry = Int.max
    
//     func dfs(_ k: Int, _ i1: Int, _ i2: Int) {
        
//         if k == maxTry { return }
        
//         guard 0..<q1.count ~= i1 && 0..<q2.count ~= i2 else { return }
        
//         if sum1 == sum2 {
//             minTry = min(minTry, k)
//             return
//         }
        
//         // q1 -> q2
//         if 0..<q1.count ~= i1 {
//             sum1 -= q1[i1]
//             sum2 += q1[i1]
//             q2.append(q1[i1])
//             dfs(k+1, i1+1, i2)
//             sum1 += q1[i1]
//             sum2 -= q1[i1]
//         }
        
//         // q2 -> q1
//         if 0..<q2.count ~= i2 {
//             sum1 += q2[i2]
//             sum2 -= q2[i2]
//             q1.append(q2[i2])
//             dfs(k+1, i1, i2+1)
//             sum1 -= q2[i2]
//             sum2 += q2[i2]
//         }
//     }
    
//     dfs(0, 0, 0)
    
//     return minTry == Int.max ? -1 : minTry
// }