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

// 시간 초과 -> O(N^3)

// O(N^2) 풀이가 필요하다.

// 0~n-1가지 돌면서
    // mid를 중심으로 좌측으로 확장, 우측으로 확장
    // left가 작다면 left 확장, right가 작다면 right 확장
    // 값이 동일하다면 cnt += 1
    // 값이 동일하지 않은 채로 끝에 도달 ? contonue

func solution(_ cookie: [Int]) -> Int {
    let n = cookie.count
    var maxCookie = 0
    
    for i in 0..<n-1 {
        let mid = i
        var left = i
        var right = i+1
        var leftSum = cookie[left]
        var rightSum = cookie[right]
        
        while 0..<n ~= left && 0..<n ~= right {
            
            if leftSum == rightSum {
                maxCookie = max(maxCookie, leftSum)
            }
            
            if leftSum <= rightSum && left > 0 {
                left -= 1
                leftSum += cookie[left]
                
            } else if leftSum > rightSum && right < n-1 {
                right += 1
                rightSum += cookie[right]
                
            } else {
                break
            }
        }
    }
    
    return maxCookie
}








