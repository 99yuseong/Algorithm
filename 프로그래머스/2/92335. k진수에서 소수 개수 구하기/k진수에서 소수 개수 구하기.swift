import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    
    let numk = Array(nToK(n, k)) // k진수 문자열
    var count = 0
    
    var idx = numk[0] == "0" ? 1 : 0
    var cur: String = ""
    
    while idx < numk.count {
        if numk[idx] == "0" {
            if cur != "" { 
                if isPrime(Int(cur)!) { count += 1 }
                cur = ""
            }
            idx += 1
        } else {
            cur += String(numk[idx])
            idx += 1
        }
    }
    
    if cur != "" && isPrime(Int(cur)!) { count += 1 }
    
    return count
}
// k진수에서 소수 구하기
// 양의 정수 n > k진수로 바꿨을때, 소수는 몇개?
// 0P0 -> 조건 1, 양쪽 끝에 0
// P0  -> 조건 2, 오른쪽 끝 0, 왼쪽 X
// 0p. -> 조건 3, 왼쪽 끝 0, 오른쪽 X
// P   -> 조건 4, 앙쪽 끝에 X
// P는 자릿수에 0을 포함하지 않는 소수

// n을 k진수로 변환
// 숫자를 탐색하면서 소수를 찾고, Array(String(k진수))를 돌면서
// 소수의 최종 개수를 리턴
func isPrime(_ n: Int) -> Bool {
    if n == 1 { return false }
    if n == 2 { return true }
    if n == 3 { return true }
    
    // 1~루트n까지 나눠보고 여부 리턴
    let rootN = Int(sqrt(Double(n))) // 1000
    for i in 2...rootN { // O(1000)
        if n % i == 0 { return false }
    }
    return true
}

func nToK(_ n: Int, _ k: Int) -> String {
    var arr: [String] = []
    var cur = n
    while cur > 0 { 
        arr.append(String(cur % k))
        cur /= k
    }
    
    return arr.reversed().joined()
}