import Foundation

func solution(_ S: String) -> String {
    let chars = Array(S)  // 한 번만 변환
    let n = chars.count
    
    // **팰린드롬 확인 (O(N))**
    func isPalindrom(_ l: Int, _ r: Int) -> Bool {
        var left = l, right = r
        while left < right {
            if chars[left] != chars[right] { return false }
            left += 1
            right -= 1
        }
        return true
    }

    // **아카라카 팰린드롬 확인 (O(N log N))**
    func isAkaraka(_ l: Int, _ r: Int) -> Bool {
        if l >= r { return true }  // 길이 1이면 자동으로 팰린드롬
        let mid = (r - l + 1) / 2
        
        return isPalindrom(l, r) &&
               isAkaraka(l, l + mid - 1) &&
               isAkaraka(r - mid + 1, r)
    }

    return isAkaraka(0, n - 1) ? "AKARAKA" : "IPSELENTI"
}

// 입력 받기
print(solution(readLine()!))