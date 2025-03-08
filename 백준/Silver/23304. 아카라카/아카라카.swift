// 1. 문자열 S가 팰린드롬 - 거꾸로 읽어도 동일
// 2. S.count / 2의 길이 접두사 접미사가 모두 팰린드롬

func solution(_ S: String) -> String {
    // 문자열 길이: 1~200만
    // O(NlgN)안으로
   
    let A = Array(S)
    var isPalindrom = false
    var isAkaraka = false
    // 1. 팰린드롬 체크
    isPalindrom = palindrom(A)
    isAkaraka = akarakaPalindrom(A)
    
    func akarakaPalindrom(_ A: [Character]) -> Bool {
        if A.count == 1 { return true }
        
        let SLen = A.count / 2
        return palindrom(A) && akarakaPalindrom(Array(A[0..<SLen])) && akarakaPalindrom(Array(A[A.count-SLen..<A.count]))
    }
    
    func palindrom(_ A: [Character]) -> Bool {
        for i in 0..<A.count/2 {
            if A[i] != A[A.count-1-i] { return false }
        }
        return true
    }
    
    if isPalindrom && isAkaraka { return "AKARAKA" }
    else { return "IPSELENTI" }
}
print(solution(readLine()!))
