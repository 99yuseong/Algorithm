import Foundation

// 과자 바구니 
// 1~N번 바구니 나열
// I~M, M+1~R
// 두 바구니의 과자 수는 동일

// 아들 1명에게 줄 수 있는 가장 많은 과자 수
// 구매할 수 없다면 0을 리턴

// n: 1~2000 -> O(N^3)
// 1~500 자연수

// 500개 과자 * 2000 바구니 -> 최대 100만

// O(n^3)로 돌면서 체크 i, j, k -> O(n) 합 구하면 시간 초과
    
// 누적합 DP 

// D[i][j]는 i~j까지의 쿠키의 총합
// D[i][j] = D[i][j-1] + C[j]

func solution(_ cookie: [Int]) -> Int {
    let n = cookie.count
    var maxCookie = 0
    
    // 모든 중간점에 대해 처리
    for mid in 0..<n-1 {
        var l = mid, r = mid + 1
        var lSum = cookie[l], rSum = cookie[r]
        
        repeat {
            if lSum == rSum {
                maxCookie = max(maxCookie, lSum)
            }
            
            // 작은 쪽을 확장
            if lSum <= rSum && l > 0 {
                l -= 1
                lSum += cookie[l]
            } else if rSum < lSum && r < n - 1 {
                r += 1
                rSum += cookie[r]
            } else {
                break
            }
        } while true
    }
    
    return maxCookie
}








